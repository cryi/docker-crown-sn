#!/bin/sh

#  CROWN System Node docker template
#  Copyright © 2019 cryon.io
#
#  This program is free software: you can redistribute it and/or modify
#  it under the terms of the GNU Affero General Public License as published
#  by the Free Software Foundation, either version 3 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU Affero General Public License for more details.
#
#  You should have received a copy of the GNU Affero General Public License
#  along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
#  Contact: cryi@tutanota.com

GIT_INFO=$(curl -sL "https://api.github.com/repos/Crowndev/crown-core/releases/latest")                                       
URL=$(printf "%s\n" "$GIT_INFO" | jq .assets[].browser_download_url -r | grep Crown | grep Linux | grep 64)                         

curl -L "$URL" -o ./crown.zip

unzip ./crown.zip
rootDir=$(ls -d Crown*/)

chmod +x */bin/*
cp -f */bin/* /usr/local/bin/
cp -f */lib/* /usr/local/lib/
rm -rf $rootDir
rm -rf ./crown.zip