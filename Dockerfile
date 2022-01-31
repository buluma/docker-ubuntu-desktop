FROM ubuntu:17.10

ENV DEBIAN_FRONTEND=noninteractive \
    USER=root

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y gnome-shell ubuntu-gnome-desktop light-themes
RUN apt-get install -y gnome-panel gnome-settings-daemon metacity nautilus gnome-terminal
RUN apt-get install -y tightvncserver xfonts-base
RUN mkdir /root/.vnc

COPY xstartup /root/.vnc/xstartup
COPY passwd /root/.vnc/passwd

RUN chmod 600 /root/.vnc/passwd

CMD /usr/bin/vncserver :1 -geometry 1920x1080 -depth 24 && tail -f /root/.vnc/*:1.log

EXPOSE 5901 22