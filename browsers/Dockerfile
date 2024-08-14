FROM ghcr.io/linuxserver/baseimage-kasmvnc:debianbookworm

ENV TITLE=Browsers

RUN \
  apt-get update && \
  apt-get install --no-install-recommends -y \
    gsettings-desktop-schemas \

RUN \
  echo "**** install opera ****" && \
  if [ -z ${OPERA_VERSION+x} ]; then \
    OPERA_VERSION=$(curl -sL https://deb.opera.com/opera-stable/dists/stable/non-free/binary-amd64/Packages \
    | awk -F ': ' '/opera-stable/{ getline; print $2; exit}'); \
  fi && \
  curl -o \
    /tmp/opera.deb -L \
    "https://deb.opera.com/opera-stable/pool/non-free/o/opera-stable/opera-stable_${OPERA_VERSION}_amd64.deb" && \
  DEBIAN_FRONTEND=noninteractive apt install --no-install-recommends -y /tmp/opera.deb && \
  echo "**** opera docker tweaks ****" && \
  mv \
    /usr/bin/opera \
    /usr/bin/opera-real && \
  echo "**** cleanup ****" && \
  apt-get autoclean && \
  rm -rf \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /tmp/*

RUN \
  echo "**** install edge ****" && \
  if [ -z ${EDGE_VERSION+x} ]; then \
    EDGE_VERSION=$(curl -sL https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/ | awk -F'(<a href="microsoft-edge-stable_|_amd64.deb")' '/href=/ {print $2}' | sort --version-sort | tail -1); \
  fi && \
  curl -o \
    /tmp/edge.deb -L \
    "https://packages.microsoft.com/repos/edge/pool/main/m/microsoft-edge-stable/microsoft-edge-stable_${EDGE_VERSION}_amd64.deb" && \
  apt install --no-install-recommends -y \
    /tmp/edge.deb && \
  echo "**** edge docker tweaks ****" && \
  mv \
    /usr/bin/microsoft-edge \
    /usr/bin/microsoft-edge-real && \
  echo "**** cleanup ****" && \
  apt-get autoclean && \
  rm -rf \
    /config/.cache \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /tmp/*

RUN \
  echo "**** install firefox ****" && \
  if [ -z ${FIREFOX_VERSION+x} ]; then \
    FIREFOX_VERSION=$(curl -sL "http://dl-cdn.alpinelinux.org/alpine/v3.20/community/x86_64/APKINDEX.tar.gz" | tar -xz -C /tmp \
    && awk '/^P:firefox$/,/V:/' /tmp/APKINDEX | sed -n 2p | sed 's/^V://'); \
  fi && \
  apk add --no-cache \
    firefox==${FIREFOX_VERSION} && \
  echo "**** lang support ****" && \
  FF_VERSION=$(curl -sI https://download.mozilla.org/?product=firefox-latest | awk -F '(releases/|/win32)' '/Location/ {print $2}') && \
  REL_URL="https://releases.mozilla.org/pub/firefox/releases/${FF_VERSION}/win64/xpi/" && \
  LANGS=$(curl -Ls ${REL_URL} | awk -F '(xpi">|</a>)' '/href.*xpi/ {print $2}' | tr '\n' ' ') && \
  EXT_DIR=/usr/lib/firefox/distribution/extensions/ && \
  mkdir -p ${EXT_DIR} && \
  for LANG in ${LANGS}; do \
    LANGCODE=$(echo ${LANG} | sed 's/\.xpi//g'); \
    echo "Downloading ${LANG} Language pack"; \
    curl -o \
      ${EXT_DIR}langpack-${LANGCODE}@firefox.mozilla.org.xpi -Ls \
      ${REL_URL}${LANG};\
  done && \
  echo "**** default firefox settings ****" && \
  FIREFOX_SETTING="/usr/lib/firefox/browser/defaults/preferences/firefox.js" && \
  echo 'pref("datareporting.policy.firstRunURL", "");' > ${FIREFOX_SETTING} && \
  echo 'pref("datareporting.policy.dataSubmissionEnabled", false);' >> ${FIREFOX_SETTING} && \
  echo 'pref("datareporting.healthreport.service.enabled", false);' >> ${FIREFOX_SETTING} && \
  echo 'pref("datareporting.healthreport.uploadEnabled", false);' >> ${FIREFOX_SETTING} && \
  echo 'pref("trailhead.firstrun.branches", "nofirstrun-empty");' >> ${FIREFOX_SETTING} && \
  echo 'pref("browser.aboutwelcome.enabled", false);' >> ${FIREFOX_SETTING} && \
  echo "**** cleanup ****" && \
  rm -rf \
    /tmp/*
    
RUN \
  echo "**** install chromium ****" && \
  apt-get update && \
  apt-get install -y --no-install-recommends \
    chromium \
    chromium-l10n && \
  echo "**** cleanup ****" && \
  apt-get autoclean && \
  rm -rf \
    /config/.cache \
    /var/lib/apt/lists/* \
    /var/tmp/* \
    /tmp/*

COPY /root /

EXPOSE 3000

VOLUME /config
