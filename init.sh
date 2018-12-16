#!/usr/bin/env bash

mkdir lib
cd lib
git clone https://github.com/fox0/lua_logging.git
git clone https://github.com/fox0/love2d_camera.git

cd ../tools
git clone https://github.com/love2d-community/love-api
lua love2d.lua > love2d_stubs.lua
