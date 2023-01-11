FROM ubuntu:20.04
RUN apt-get -y update
RUN apt-get -y install git libssl-dev openssl make
RUN git clone https://github.com/Brudle/wagi-ruby
WORKDIR "/wagi-ruby"
COPY /wagi /usr/local/bin/wagi
RUN echo 'export LD_LIBRARY_PATH=/usr/local/lib' >> ~/.bash_profile && . ~/.bash_profile
RUN chmod +x "./wagi"

CMD ["make", "serve"]
