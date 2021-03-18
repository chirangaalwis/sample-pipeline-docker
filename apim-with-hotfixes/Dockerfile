# syntax = docker/dockerfile:1.0-experimental
# ------------------------------------------------------------------------
#
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
#
# ------------------------------------------------------------------------

FROM docker.wso2.com/wso2am:3.2.0.3

COPY --chown=802 apply-hotfixes.sh ./
COPY --chown=802 hotfixes ${WSO2_SERVER_HOME}/hotfixes

# For advanced configurations refer to https://github.com/moby/buildkit/blob/master/frontend/dockerfile/docs/syntax.md#run---mounttypesecret
RUN --mount=type=secret,id=wso2username,required,mode=404 --mount=type=secret,required,id=wso2password,mode=404 \
                username=$(cat /run/secrets/wso2username) \
                && password=$(cat /run/secrets/wso2password) \
                && sh apply-hotfixes.sh ${username} ${password}
