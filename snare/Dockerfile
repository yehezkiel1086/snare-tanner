FROM python:3.6-alpine3.8

RUN apk -U --no-cache add git build-base && \
    rm -rf /root/* && \
    rm -rf /tmp/* /var/tmp/* && \
    rm -rf /var/cache/apk/*

RUN pip3 install --no-cache-dir -U pip setuptools
ADD requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

COPY dist/ /root/dist/

RUN mkdir -p /opt/snare/pages && \
    mv /root/dist/pages/* /opt/snare/pages/

ADD . .
RUN python3 setup.py install

#ARG PAGE_URL=polri.go.id
ENV PAGE_URL $PAGE_URL
ENV PORT 80
ENV TANNER tanner

#RUN clone --target "https://$PAGE_URL"

CMD snare --no-dorks true --auto-update false --host-ip 0.0.0.0 --port $PORT --page-dir 10 --tanner $TANNER
#CMD snare --no-dorks true --auto-update false --host-ip 0.0.0.0 --port $PORT --page-dir "$PAGE_URL" --tanner $TANNER
