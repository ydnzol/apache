/*
 * Copyright (c) 2002-2006 Asim Jalis
 * 
 * This library is released under the zlib/libpng license as described at
 * 
 * http://www.opensource.org/licenses/zlib-license.html
 * 
 * Here is the statement of the license:
 * 
 * This software is provided 'as-is', without any express or implied warranty. 
 * In no event will the authors be held liable for any damages arising from 
 * the use of this software.
 * 
 * Permission is granted to anyone to use this software for any purpose, 
 * including commercial applications, and to alter it and redistribute it 
 * freely, subject to the following restrictions:
 * 
 * 1. The origin of this software must not be misrepresented; you must not 
 * claim that you wrote the original software. If you use this software in a 
 * product, an acknowledgment in the product documentation would be 
 * appreciated but is not required.
 * 
 * 2. Altered source versions must be plainly marked as such, and must not be
 * misrepresented as being the original software.
 * 
 * 3. This notice may not be removed or altered from any source distribution.
 */
/*
 * This file has been modified from the original distribution.
 */

#include <assert.h>
#include <setjmp.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

#include "CuTest.h"

static int verbose = 0;

void CuInit(int argc, char *argv[])
{
	int c;
	
	c = getopt(argc, argv, "v");
	if (c == 'v') {
		verbose = 1;
	}
}

/*-------------------------------------------------------------------------*
 * CuStr
 *-------------------------------------------------------------------------*/

char* CuStrAlloc(int size)
{
	char* new = (char*) malloc( sizeof(char) * (size) );
	return new;
}

char* CuStrCopy(char* old)
{
	int len = strlen(old);
	char* new = CuStrAlloc(len + 1);
	strcpy(new, old);
	return new;
}

/*-------------------------------------------------------------------------*
 * CuString
 *-------------------------------------------------------------------------*/

void CuStringInit(CuString* str)
{
	str->length = 0;
	str->size = STRING_MAX;
	str->buffer = (char*) malloc(sizeof(char) * str->size);
	str->buffer[0] = '\0';
}

CuString* CuStringNew(void)
{
	CuString* str = (CuString*) malloc(sizeof(CuString));
	str->length = 0;
	str->size = STRING_MAX;
	str->buffer = (char*) malloc(sizeof(char) * str->size);
	str->buffer[0] = '\0';
	return str;
}

void CuStringResize(CuString* str, int newSize)
{
	str->buffer = (char*) realloc(str->buffer, sizeof(char) * newSize);
	str->size = newSize;
}

void CuStringAppend(CuString* str, char* text)
{
	int length = strlen(text);
	if (str->length + length + 1 >= str->size)
		CuStringResize(str, str->length + length + 1 + STRING_INC);
	str->length += length;
	strcat(str->buffer, text);
}

void CuStringAppendChar(CuString* str, char ch)
{
	char text[2];
	text[0] = ch;
	text[1] = '\0';
	CuStringAppend(str, text);
}

void CuStringAppendFormat(CuString* str, char* format, ...)
{
	va_list argp;
	char buf[HUGE_STRING_LEN];
	va_start(argp, format);
	vsprintf(buf, format, argp);
	va_end(argp);
	CuStringAppend(str, buf);
}

void CuStringRead(CuString *str, char *path)
{
	path = strdup(str->buffer);
}

/*-------------------------------------------------------------------------*
 * CuTest
 *-------------------------------------------------------------------------*/

void CuTestInit(CuTest* t, char* name, TestFunction function)
{
	t->name = CuStrCopy(name);
	t->notimpl = 0;
	t->failed = 0;
	t->ran = 0;
	t->message = NULL;
	t->function = function;
	t->jumpBuf = NULL;
}

CuTest* CuTestNew(char* name, TestFunction function)
{
	CuTest* tc = CU_ALLOC(CuTest);
	CuTestInit(tc, name, function);
	return tc;
}

void CuNotImpl(CuTest* tc, char* message)
{
	CuString* newstr = CuStringNew();
        CuStringAppend(newstr, message);
        CuStringAppend(newstr, " not implemented on this platform");
	tc->notimpl = 1;
	tc->message = CuStrCopy(newstr->buffer);
	if (tc->jumpBuf != 0) longjmp(*(tc->jumpBuf), 0);
}

void CuFail(CuTest* tc, char* message)
{
	tc->failed = 1;
	tc->message = CuStrCopy(message);
	if (tc->jumpBuf != 0) longjmp(*(tc->jumpBuf), 0);
}

void CuAssert(CuTest* tc, char* message, int condition)
{
	if (condition) return;
	CuFail(tc, message);
}

void CuAssertTrue(CuTest* tc, int condition)
{
	if (condition) return;
	CuFail(tc, "assert failed");
}

void CuAssertStrEquals(CuTest* tc, char* expected, char* actual)
{
	CuString* message;
	if (strcmp(expected, actual) == 0) return;
	message = CuStringNew();
	CuStringAppend(message, "expected\n---->\n");
	CuStringAppend(message, expected);
	CuStringAppend(message, "\n<----\nbut saw\n---->\n");
	CuStringAppend(message, actual);
	CuStringAppend(message, "\n<----\n");
	CuFail(tc, message->buffer);
}

void CuAssertIntEquals(CuTest* tc, int expected, int actual)
{
	char buf[STRING_MAX];
	if (expected == actual) return;
	sprintf(buf, "expected <%d> but was <%d>", expected, actual);
	CuFail(tc, buf);
}

void CuAssertPtrEquals(CuTest* tc, void* expected, void* actual)
{
	char buf[STRING_MAX];
	if (expected == actual) return;
	sprintf(buf, "expected pointer <0x%X> but was <0x%X>", expected, actual);
	CuFail(tc, buf);
}

void CuAssertPtrNotNull(CuTest* tc, void* pointer)
{
	char buf[STRING_MAX];
	if (pointer != NULL ) return;
	sprintf(buf, "null pointer unexpected", pointer);
	CuFail(tc, buf);
}

void CuTestRun(CuTest* tc)
{
	jmp_buf buf;
	tc->jumpBuf = &buf;
	if (setjmp(buf) == 0)
	{
		tc->ran = 1;
		(tc->function)(tc);
	}
	tc->jumpBuf = 0;
}

/*-------------------------------------------------------------------------*
 * CuSuite
 *-------------------------------------------------------------------------*/

void CuSuiteInit(CuSuite* testSuite, char *name)
{
	testSuite->name = strdup(name);
	testSuite->count = 0;
	testSuite->failCount = 0;
	testSuite->notimplCount = 0;
}

CuSuite* CuSuiteNew(char *name)
{
	CuSuite* testSuite = CU_ALLOC(CuSuite);
	CuSuiteInit(testSuite, name);
	return testSuite;
}

void CuSuiteAdd(CuSuite* testSuite, CuTest *testCase)
{
	assert(testSuite->count < MAX_TEST_CASES);
	testSuite->list[testSuite->count] = testCase;
	testSuite->count++;
}

void CuSuiteAddSuite(CuSuite* testSuite, CuSuite* testSuite2)
{
	int i;
	for (i = 0 ; i < testSuite2->count ; ++i)
	{
		CuTest* testCase = testSuite2->list[i];
		CuSuiteAdd(testSuite, testCase);
	}
}

void CuSuiteRun(CuSuite* testSuite)
{
	int i;
	for (i = 0 ; i < testSuite->count ; ++i)
	{
		CuTest* testCase = testSuite->list[i];
		CuTestRun(testCase);
		if (testCase->failed) { testSuite->failCount += 1; }
		if (testCase->notimpl) { testSuite->notimplCount += 1; }
	}
}

void CuSuiteSummary(CuSuite* testSuite, CuString* summary)
{
	int i;
	CuStringAppendFormat(summary, "%s:\t", testSuite->name);
	for (i = 0 ; i < testSuite->count ; ++i)
	{
		CuTest* testCase = testSuite->list[i];
		CuStringAppend(summary, testCase->failed ? "F" : 
                               testCase->notimpl ? "N": ".");
	}
	CuStringAppend(summary, "\n");
}

void CuSuiteOverView(CuSuite* testSuite, CuString* details)
{
	int i;
	int failCount = 0;
	int notImpleCount = 0;
	int passCount = testSuite->count - testSuite->failCount;

	CuStringAppendFormat(details, "%d %s run:  %d passed, %d failed, "
			     "%d not implemented.\n",
			     testSuite->count, 
			     testSuite->count == 1 ? "test" : "tests",
   			     testSuite->count - testSuite->failCount - 
				testSuite->notimplCount,
			     testSuite->failCount, testSuite->notimplCount);
}

void CuSuiteDetails(CuSuite* testSuite, CuString* details)
{
	int i;
	int failCount = 0;
	int notImpleCount = 0;
	int passCount = testSuite->count - testSuite->failCount;
	char* testWord = passCount == 1 ? "test" : "tests";

	if (testSuite->failCount != 0 && verbose)
	{
		CuStringAppendFormat(details, "Failed tests:\n");
		for (i = 0 ; i < testSuite->count ; ++i)
		{
			CuTest* testCase = testSuite->list[i];
			if (testCase->failed)
			{
				failCount++;
				CuStringAppendFormat(details, "%d) %s: %s\n", 
					failCount, testCase->name, testCase->message);
			}
		}
	}
	if (testSuite->notimplCount != 0 && verbose)
	{
		CuStringAppendFormat(details, "\nNot Implemented tests:\n");
		for (i = 0 ; i < testSuite->count ; ++i)
		{
			CuTest* testCase = testSuite->list[i];
			if (testCase->notimpl)
			{
			        failCount++;
			        CuStringAppendFormat(details, "%d) %s: %s\n",
			                failCount, testCase->name, testCase->message);
			}
		}
	}
}

/*-------------------------------------------------------------------------*
 * CuSuiteList
 *-------------------------------------------------------------------------*/

CuSuiteList* CuSuiteListNew(char *name)
{
	CuSuiteList* testSuite = CU_ALLOC(CuSuiteList);
	testSuite->name = strdup(name);
	testSuite->count = 0;
	return testSuite;
}

void CuSuiteListAdd(CuSuiteList *suites, CuSuite *origsuite)
{
	assert(suites->count < MAX_TEST_CASES);
	suites->list[suites->count] = origsuite;
	suites->count++;
}

void CuSuiteListRun(CuSuiteList* testSuite)
{
	int i;
	for (i = 0 ; i < testSuite->count ; ++i)
	{
		CuSuite* testCase = testSuite->list[i];
		CuSuiteRun(testCase);
	}
}

void CuSuiteListSummary(CuSuiteList* testSuite, CuString* summary)
{
	int i;
	CuStringAppendFormat(summary, "%s:\n", testSuite->name);
	for (i = 0 ; i < testSuite->count ; ++i)
	{
		CuSuite* testCase = testSuite->list[i];
		CuString *str = CuStringNew();
		CuSuiteSummary(testCase, str);
		CuStringAppend(summary, "    ");
		CuStringAppend(summary, str->buffer);
	}
	CuStringAppend(summary, "\n");
}

void CuSuiteListDetails(CuSuiteList* testSuite, CuString* details)
{
	int i;
	int failCount = 0;
	int notImplCount = 0;
	int passCount = 0;
	int count = 0;
	char *testWord = passCount == 1 ? "test" : "tests";

	for (i = 0 ; i < testSuite->count ; ++i)
	{
		failCount += testSuite->list[i]->failCount;
		notImplCount += testSuite->list[i]->notimplCount;
                count += testSuite->list[i]->count;
	}
	CuStringAppendFormat(details, "%d %s run:  %d passed, %d failed, "
			     "%d not implemented.\n",
			     count, 
			     count == 1 ? "test" : "tests",
   			     count - failCount - notImplCount,
			     failCount, notImplCount);

	if (failCount != 0 && verbose)
	{
		for (i = 0 ; i < testSuite->count ; ++i)
		{
			CuString *str = CuStringNew();
			CuSuite* testCase = testSuite->list[i];
			if (testCase->failCount)
			{
				CuSuiteDetails(testCase, str);
				CuStringAppend(details, str->buffer);
			}
		}
	}
	if (notImplCount != 0 && verbose)
	{
		CuStringAppendFormat(details, "\nNot Implemented tests:\n");
		for (i = 0 ; i < testSuite->count ; ++i)
		{
			CuString *str = CuStringNew();
			CuSuite* testCase = testSuite->list[i];
			if (testCase->notimplCount)
			{
				CuSuiteDetails(testCase, str);
				CuStringAppend(details, str->buffer);
			}
		}
	} 
}

