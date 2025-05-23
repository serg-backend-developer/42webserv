#ifndef SERVER_HPP
#define SERVER_HPP

#include "ConfigParser.hpp"
#include "ServerConfig.hpp"
#include "SocketManager.hpp"
#include "HttpRequest.hpp"
#include "HttpResponse.hpp"
#include <vector>
#include <stdexcept>
#include <string>
#include <unistd.h>
#include <iostream>
#include <cstring>
#include <stdlib.h>
#include <signal.h>
#include "CGIManager.hpp"

const std::size_t BUFFER_SIZE = 4096;

class Server {
public:
	Server(const std::string &config);

	void loop();

private:
	std::vector<ServerConfig> servers;
	SocketManager socketManager;	

	void parseConfig(const std::string &config);
	void execRead(int fd);
	void execCgiRead(int fd);
	void execWrite(int fd);
	void print(std::vector<Connection*>& cons);
};

#endif
