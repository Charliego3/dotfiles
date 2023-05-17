#!/bin/sh

function checkInstalled() {
    if which "$1" >/dev/null 2>&1; then
        return true
    else
        return false
    fi
}

function checkBrew() {

}
