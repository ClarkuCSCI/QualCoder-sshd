FROM peterstory/sshd-password
MAINTAINER PeStory@clarku.edu

# Dependencies for QualCoder
RUN apt update && apt install -y \
  git \
  python3-pip \
  python3-pyqt6 \
  python3-vlc

RUN pip install --break-system-packages chardet EbookLib openpyxl pandas pdfminer.six Pillow plotly ply pydub rispy six SpeechRecognition

# Install QualCoder
WORKDIR root
RUN git clone --depth 1 --branch 3.5 https://github.com/ccbogel/QualCoder.git && \
  cd /root/QualCoder && \
  pip install --break-system-packages . && \
  cd /root && \
  rm -Rf QualCoder
