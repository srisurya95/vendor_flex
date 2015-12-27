#!/bin/bash

./vendor/flex/tools/colors

function e()
{
echo -e $bldred "$@" $txtrst;
}

f=$(which figlet);
if [ "$f" == "" ];
then
e "";
e "  ______ _            ____   _____";
e " |  ____| |          / __ \ / ____|";
e " | |__  | | _____  _| |  | | (___";
e " |  __| | |/ _ \ \/ / |  | |\___\\";
e " | |    | |  __/>  <| |__| |____) |";
e " |_|    |_|\___/_/\_\\____/|_____/";
e "";

e "Please install 'figlet' tool";
else
figlet "FlexOS";
fi
