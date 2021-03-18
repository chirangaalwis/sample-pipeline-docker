#!/bin/bash
# ------------------------------------------------------------------------
# Copyright 2021 WSO2, Inc. (http://wso2.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License
# ------------------------------------------------------------------------

${WSO2_SERVER_HOME}/bin/wso2update_linux current-state --username $1 --password $2

for hotfix in `ls "${WSO2_SERVER_HOME}/hotfixes" | grep .zip | sort --version-sort -f`;
do
    ${WSO2_SERVER_HOME}/bin/wso2update_linux apply-hotfix "${WSO2_SERVER_HOME}/hotfixes/${hotfix}"
done;
