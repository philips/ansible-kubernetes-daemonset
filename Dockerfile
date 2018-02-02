FROM debian:stretch

RUN apt-get update && apt-get install -y python2.7 python-pip bash && pip install ansible && ansible-galaxy install defunctzombie.coreos-bootstrap
ADD site.yml /srv/ansible/site.yml
