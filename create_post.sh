#!/bin/env bash

if [ -z $1 ];
then
    title=new_post
else
    title=$1
fi

now=$(date "+%F %T %Z")
today=$(date "+%F")
fname=$today-$title.md

function generate_template {
    template=$'---';
    template+=$'\nlayout:\tpost'
    template+=$'\ntitle:\t'$title
    template+=$'\ndate:\t'$now
    template+=$'\ncategories:\t'
    template+=$'\n---';
    template+=$'\nYour text here';
    echo "$template" >> ./_posts/$fname
}

generate_template


