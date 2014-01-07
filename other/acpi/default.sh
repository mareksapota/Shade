#!/bin/bash
#
# Copyright (c) 2014 Marek Sapota
#
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without
# restriction, including without limitation the rights to use,
# copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following
# conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE

group=$1
case "$group" in
  ac_adapter)
    value=$4
    if [[ $value -eq 1 ]]; then
      shade pm performance
    else
      shade pm powersave
      shade sleep sleep_on_lid_close
    fi
    ;;
  button/lid)
    # This will check if lid is open or closed, on some systems $3 will be
    # 'open' or 'closed' but on others there is no indication if the event
    # was triggered by closing or opening of the lid.
    shade sleep sleep_on_lid_close
    ;;
esac