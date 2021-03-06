// Copyright 2010-2014 Google
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// This file provides swig wrapping for some specialization of std::function
// parameters. Currently, swig does not support much of C++11 features, and
// especially not the std::function.

// C# callers will need to use a specific "type" of callbacks: they must
// specialize one of the existing generic callback classes defined in
// ../functions_swig_helpers.h (which are SWIG-wrapped to C# in a
// straightforward way). See the examples.

%include "base/base.swig"

%include "std_common.i"
%include "std_string.i"

%{
#include <functional>
#include "base/integral_types.h"
#include "util/functions_swig_helpers.h"
%}

%module(directors="1") operations_research_swig_util

// --------- Include the swig helpers file to create the director classes ------
// We cannot use %ignoreall/%unignoreall as this is not compatible with nested
// swig files.

%feature("director") operations_research::swig_util::LongToLong;
%rename (Run) operations_research::swig_util::LongToLong::run;
%feature("director") operations_research::swig_util::LongLongToLong;
%rename (Run) operations_research::swig_util::LongLongToLong::run;
%feature("director") operations_research::swig_util::IntIntToLong;
%rename (Run) operations_research::swig_util::IntIntToLong::run;
%feature("director") operations_research::swig_util::LongLongLongToLong;
%rename (Run) operations_research::swig_util::LongLongLongToLong::run;
%feature("director") operations_research::swig_util::LongToBoolean;
%rename (Run) operations_research::swig_util::LongToBoolean::run;
%feature("director") operations_research::swig_util::VoidToString;
%rename (Run) operations_research::swig_util::VoidToString::run;
%feature("director") operations_research::swig_util::VoidToBoolean;
%rename (Run) operations_research::swig_util::VoidToBoolean::run;
%feature("director") operations_research::swig_util::LongLongLongToBoolean;
%rename (Run) operations_research::swig_util::LongLongLongToBoolean::run;
%feature("director") operations_research::swig_util::LongToVoid;
%rename (Run) operations_research::swig_util::LongToVoid::run;

%include "util/functions_swig_helpers.h"
