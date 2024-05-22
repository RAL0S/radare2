#!/usr/bin/env bash

set -e

show_usage() {
  echo "Usage: $(basename $0) takes exactly 1 argument (install | uninstall)"
}

if [ $# -ne 1 ]
then
  show_usage
  exit 1
fi

check_env() {
  if [[ -z "${RALPM_TMP_DIR}" ]]; then
    echo "RALPM_TMP_DIR is not set"
    exit 1
  
  elif [[ -z "${RALPM_PKG_INSTALL_DIR}" ]]; then
    echo "RALPM_PKG_INSTALL_DIR is not set"
    exit 1
  
  elif [[ -z "${RALPM_PKG_BIN_DIR}" ]]; then
    echo "RALPM_PKG_BIN_DIR is not set"
    exit 1
  fi
}

install() {
  wget https://github.com/radareorg/radare2/releases/download/5.7.8/radare2-5.7.8-static.tar.xz -O $RALPM_TMP_DIR/radare2-5.7.8-static.tar.xz
  tar xf $RALPM_TMP_DIR/radare2-5.7.8-static.tar.xz -C $RALPM_PKG_INSTALL_DIR/
  rm $RALPM_TMP_DIR/radare2-5.7.8-static.tar.xz

  ln -s $RALPM_PKG_INSTALL_DIR/r2-static/usr/bin/r2 $RALPM_PKG_BIN_DIR/r2
  ln -s $RALPM_PKG_INSTALL_DIR/r2-static/usr/bin/r2p $RALPM_PKG_BIN_DIR/r2p
  ln -s $RALPM_PKG_INSTALL_DIR/r2-static/usr/bin/r2pm.sh $RALPM_PKG_BIN_DIR/r2pm.sh
  ln -s $RALPM_PKG_INSTALL_DIR/r2-static/usr/bin/r2pm $RALPM_PKG_BIN_DIR/r2pm
  ln -s $RALPM_PKG_INSTALL_DIR/r2-static/usr/bin/r2r $RALPM_PKG_BIN_DIR/r2r
  ln -s $RALPM_PKG_INSTALL_DIR/r2-static/usr/bin/rabin2 $RALPM_PKG_BIN_DIR/rabin2
  ln -s $RALPM_PKG_INSTALL_DIR/r2-static/usr/bin/rafind2 $RALPM_PKG_BIN_DIR/rafind2
  ln -s $RALPM_PKG_INSTALL_DIR/r2-static/usr/bin/ragg2 $RALPM_PKG_BIN_DIR/ragg2
  ln -s $RALPM_PKG_INSTALL_DIR/r2-static/usr/bin/rax2 $RALPM_PKG_BIN_DIR/rax2
  ln -s $RALPM_PKG_INSTALL_DIR/r2-static/usr/bin/radiff2 $RALPM_PKG_BIN_DIR/radiff2
  ln -s $RALPM_PKG_INSTALL_DIR/r2-static/usr/bin/rarun2 $RALPM_PKG_BIN_DIR/rarun2
  ln -s $RALPM_PKG_INSTALL_DIR/r2-static/usr/bin/rasm2 $RALPM_PKG_BIN_DIR/rasm2
  ln -s $RALPM_PKG_INSTALL_DIR/r2-static/usr/bin/radare2 $RALPM_PKG_BIN_DIR/radare2
  ln -s $RALPM_PKG_INSTALL_DIR/r2-static/usr/bin/rahash2 $RALPM_PKG_BIN_DIR/rahash2
  ln -s $RALPM_PKG_INSTALL_DIR/r2-static/usr/bin/r2agent $RALPM_PKG_BIN_DIR/r2agent
  ln -s $RALPM_PKG_INSTALL_DIR/r2-static/usr/bin/ravc2 $RALPM_PKG_BIN_DIR/ravc2
  ln -s $RALPM_PKG_INSTALL_DIR/r2-static/usr/bin/rasign2 $RALPM_PKG_BIN_DIR/rasign2
}

uninstall() {
  rm $RALPM_PKG_BIN_DIR/r2
  rm $RALPM_PKG_BIN_DIR/r2p
  rm $RALPM_PKG_BIN_DIR/r2pm.sh
  rm $RALPM_PKG_BIN_DIR/r2pm
  rm $RALPM_PKG_BIN_DIR/r2r
  rm $RALPM_PKG_BIN_DIR/rabin2
  rm $RALPM_PKG_BIN_DIR/rafind2
  rm $RALPM_PKG_BIN_DIR/ragg2
  rm $RALPM_PKG_BIN_DIR/rax2
  rm $RALPM_PKG_BIN_DIR/radiff2
  rm $RALPM_PKG_BIN_DIR/rarun2
  rm $RALPM_PKG_BIN_DIR/rasm2
  rm $RALPM_PKG_BIN_DIR/radare2
  rm $RALPM_PKG_BIN_DIR/rahash2
  rm $RALPM_PKG_BIN_DIR/r2agent
  rm $RALPM_PKG_BIN_DIR/ravc2
  rm $RALPM_PKG_BIN_DIR/rasign2
  rm -rf $RALPM_PKG_INSTALL_DIR/r2-static
}

run() {
  if [[ "$1" == "install" ]]; then 
    install
  elif [[ "$1" == "uninstall" ]]; then 
    uninstall
  else
    show_usage
  fi
}

check_env
run $1