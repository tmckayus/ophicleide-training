FROM tmckay/openshift-spark:sp2.4-t

USER root

ADD . /opt/ophicleide

WORKDIR /opt/ophicleide

RUN easy_install pip \
 && pip install setuptools==36.2.5 \
 && pip install -r requirements.txt \
 && pip wheel -r wheel-requirements.txt -w . \
 && mv pymongo*.whl pymongo.zip

USER 185

CMD /opt/ophicleide/run.sh
