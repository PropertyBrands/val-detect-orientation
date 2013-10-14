#!/bin/bash

ERROR_COUNT=0
TEST_COUNTER=0

test_image () {
  let TEST_COUNTER=$TEST_COUNTER+1

  file=$1
  # read in expected from file
  expected=`cut -d '"' -f2 "$2"`

  result=`./bin/detect_orientation $file`

  echo
  echo -n "Test ${TEST_COUNTER}: ${file}.............."

  if [ "$expected" != "$result" ]; then
    echo "FAILURE"
    print_banner 'FAIL'
    print_result_block "Expected" "$expected"
    print_result_block "Got" "$result"
  else
    echo "Success!"
  fi
}

print_banner () {
  echo "  ************ $1 ************"
}

print_result_block () {
  print_line 2
  echo -e "  $1:"

  OIFS="$IFS"
  IFS=$'\n'

  for line in $2; do
    echo -e "    $line"
  done

  IFS="$OIFS"
}

print_line () {
  times=0
  if [ "$1" != "" ]; then times=$1; fi
  str="-----------------------------------"
  i=0
  while [ $i -lt $times ]; do
    str=" $str"
    let i=$i+1
  done

  echo "$str"
}

echo "Running through image files with known results..."
test_image ./test/orientation_0-1.pbm ./test/orientation_0-1.expected
test_image ./test/orientation_3-1.pbm ./test/orientation_3-1.expected
test_image ./test/orientation_3-2.pbm ./test/orientation_3-2.expected

echo
echo "Weak Margin Tests..."
# Weak margin (4.61)
test_image ./test/orientation_2-1_weak_margin.pbm ./test/orientation_2-1_weak_margin.expected
