# Docker From the Ground Up: Working With Containers

1. [Part 1](#part-1)
2. [Part 2](#part-2)
3. [Credits](#credits)

## Part 1

This is part one of a two-part series about working with Docker containers. In this part, we'll focus on the many ways and options to run an image and how the host can interact with a Docker container.

In the second part we'll cover listing, starting, stopping and restarting containers as well as executing commands on running containers. Docker images are the units of deployment. When you run an image, you instantiate a Docker container that runs a single process in its own isolated environment for the file system, networking and processes tree.

Docker containers are very flexible and enable many use cases that are too heavyweight, complex and/or expensive with other technologies like virtual machines and bare metal servers.

Before we start, make sure that Docker is installed properly in your environment. Depending on how it installed and your user, you may need to run it as sudo. I'll skip the sudo.

### Running an Image

You launch a Docker container by running an image. There are several ways to run a container that affect how easy it is to manage all the containers. When the container starts, it typically runs the command defined in the Dockerfile. Here is the Dockerfile for the hello-world container:

```dockerfile
FROM scratch
COPY hello /
CMD ["/hello"]
```

The command simply runs the "hello" binary that was copied to the root of the container when building the image.

#### Foreground vs. Detached

A container can run in the foreground where it blocks until the process exits and the container stops running. In foreground mode, the container prints its output to the console and can read standard input. In detached mode (when you provide the -d flag), control returns immediately and the container

#### Running an Unnamed Container

The simplest way to run a container is: `docker run <image id or name>`.

When you run a container using this command, Docker will assign it a name composed of two random words. For example: `docker run hello-world`.

If you already have the hello-world image then Docker will run it. If you don't, it will pull it from the official Docker repository DockerHub and then run it. The output should look like:

```bash
Hello from Docker!
This message shows that your installation appears to be working correctly.
To generate this message, Docker took the following steps:
1. The Docker client contacted the Docker daemon.
2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
3. The Docker daemon created a new container from that image which runs the executable that produces the output you are currently reading.
4. The Docker daemon streamed that output to the Docker client, which sent it to your terminal. To try something more ambitious, you can run an Ubuntu container with: $ docker run -it ubuntu bash
Share images, automate work-flows, and more with a free Docker ID: https://cloud.docker.com/
For more examples and ideas, visit: https://docs.docker.com/engine/userguide/
```

The hello program exits after displaying the message, which terminates the process running inside the container and ends the container run. The container still sticks around in case you want to connect to it, examine logs, or anything else. To view the container, you can run the following command:

```bash
docker ps -a  --format "table {{.ID}}\t{{.Status}}\t{{.Names}}"
CONTAINER ID        STATUS                     NAMES
8e2e491accb5        Exited (0) 2 minutes ago   clever_liskov
```

I'll explain later how to list containers and all the relevant options. For now, let's focus on the Names section. Docker generated the name "clever_liskov" automatically, and I'll have to use it or the container ID to refer to this container for any purpose like restarting it, removing it, or executing a command.

#### Running a Named Container

Using container IDs or auto-generated names is sometimes inconvenient. If you interact frequently with a container you re-create frequently, then it will get a different ID and auto-generated name. Also, the name will be random.

Docker lets you name your containers when you run them by providing a "--name <container name>" command-line argument. In simple cases, where you have just one container per image, you can name the container after your image: `docker run --name hello-world hello-world`.

Now, if we look at the process (I removed **clever_liskov** earlier) we'll see that the container is named hello-world:

```bash
docker ps -a --format "table {{.ID}}\t{{.Names}}"
CONTAINER ID        NAMES
f6fe77b3b6e8        hello-world
```

There are several benefits to a named container:

- You have a stable name for your containers you use both interactively and in scripts.
- You can choose a meaningful name.
- You can choose a short name for convenience when working interactively.
- It prevents you from accidentally having multiple containers of the same image (as long as you always provide the same name).

Let's look at the last option. If I try to run the same run command again with the same "hello-world" name, I get a clear error message:

```bash
docker run --name hello-world hello-world
docker: Error response from daemon: Conflict. The container name "/hello-world" is already in use by container f6fe77b3b6e8e77ccf346c32c599e67b2982893ca39f0415472c2949cacc4a51.
You have to remove (or rename) that container to be able to reuse that name. See 'docker run --help'.
```

#### Running an Auto-Remove Image

Containers stick around by default. Sometimes, you don't need them. Instead of manually removing exited containers, you make the container go away on its own. The `--rm` command-line argument does the trick: `docker run --rm hello-world`.

#### Running a Different Command

By default, Docker runs the command specified in the Dockerfile used to build the image (or directly the entry-point if no command is found). You can always override it by providing your own command at the end of the run command. Let's run `ls -la` on the **busybox** image (the **hello-world** image has no `ls` executable):

```bash
docker run busybox ls -la
total 44
drwxr-xr-x   18 root     root          4096 Mar 18 17:06 .
drwxr-xr-x   18 root     root          4096 Mar 18 17:06 ..
-rwxr-xr-x    1 root     root             0 Mar 18 17:06 .dockerenv
drwxr-xr-x    2 root     root         12288 Mar  9 00:05 bin
drwxr-xr-x    5 root     root           340 Mar 18 17:06 dev
drwxr-xr-x    2 root     root          4096 Mar 18 17:06 etc
drwxr-xr-x    2 nobody   nogroup       4096 Mar  9 00:05 home
dr-xr-xr-x   85 root     root             0 Mar 18 17:06 proc
drwxr-xr-x    2 root     root          4096 Mar  9 00:05 root
dr-xr-xr-x   13 root     root             0 Mar 18 17:06 sys
drwxrwxrwt    2 root     root          4096 Mar  9 00:05 tmp
drwxr-xr-x    3 root     root          4096 Mar  9 00:05 usr
drwxr-xr-x    4 root     root          4096 Mar  9 00:05 var
```

### Interacting With the Host

Docker containers run isolated processes in their own little world. But it is often necessary and useful to provide access to the host.

#### Passing Environment Variables to a Container

Docker containers don't automatically inherit the environment of the host process that ran them. You need to explicitly provide environment variables to the container when you run it using the `-e` command-line flag. You can pass multiple environment variables. Here is an example:

```bash
docker run --rm -it -e ENV_FROM_HOST="123" busybox
/ # env
HOSTNAME=8e7672bce5a7
SHLVL=1
HOME=/root
ENV_FROM_HOST=123
TERM=xterm"
PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
PWD=/
/ #
```

The first line runs the busybox container, passing it the **ENV_FROM_HOST**variable and then inside the container running `env` shows that the **ENV_FROM_HOST** is properly set.

You can use host environment variables too. This sets a couple of host environment variables and uses them in the run command:

```bash
$ export VAR_1=1
$ export VAR_2=2
$ docker run --rm -it -e VAR_1="$VAR_1" -e VAR_2="$VAR_2" busybox
```

Inside the container, they are now visible:

```bash
/ # env | grep VAR
VAR_1=1
VAR_2=2
```

#### Mounting Host Directories

One of the most useful interactions is mounting host directories. That allows several interesting use cases:

- Shared storage between containers running on the same host.
- Viewing and editing files using your host environment and tools and using the files in the container.
- Host-level persistence beyond the lifetime of a container.

Here I create a file on the host: `$ echo "Yeah, it works!" > ~/data/1.txt`

Then I run the **busybox** image mounting the **~/data directory** to **/data** in the container and displaying the file contents on the screen:

```bash
$ docker run --rm -v ~/data:/data busybox cat /data/1.txt
Yeah, it works!
```

I used the `cat /data/1.txt` command here.

#### Exposing Ports to the Host

If you expose a port in your Dockerfile using **EXPOSE**, it will be accessible only to other docker containers. To make it accessible on the host, you need to use the `-p` command-line argument. The syntax is `-p <host port>:<exposed container port>`.

Here is running the **nginx** image, which exposes port 80 and uses the `-p`command-line argument to make it visible on the host on port 9000:

```bash
docker run --name nginx --rm -d -p 9000:80 nginx
```

Note that unlike the previous commands that performed some tasks and completed, the nginx container will keep running and listening to incoming requests. Let's verify that nginx is really up and running and responds to requests on port 9000. I prefer the excellent [httpie](https://httpie.org/) HTTP client over curl for hitting web servers and services from the command line:

```bash
http HEAD localhost:9000`
HTTP/1.1 200 OK
Accept-Ranges: bytes
Connection: keep-alive
Content-Length: 612
Content-Type: text/html
Date: Sun, 19 Mar 2017 07:35:55 GMT
ETag: "58a323e4-264"
Last-Modified: Tue, 14 Feb 2017 15:36:04 GMT
Server: nginx/1.11.10
```

### Conclusion: Part 1

There are many ways to run a Docker image to create a container, and there are many options. Each combination supports a particular use. It is very useful when working with Docker containers to fully grasp the details and use the best method to launch your containers.

In addition, attaching host volumes and exposing and publishing ports allows tight integration with the host and a plethora of use scenarios. In part two, we'll dive into managing a bunch of containers and taking advantage of the full power Docker provides.

## Part 2

This is part two of a two-part series about working with Docker containers. In [part one](http://code.tutsplus.com/tutorials/docker-from-the-ground-up-working-with-containers-part-1--cms-28483), we focused on the many ways and options to run an image and how the host can interact with a Docker container.

In this part, we'll cover listing, starting, stopping and restarting containers as well as executing commands on running containers. In particular, you'll learn the difference between running and stopped (exited) containers, and how to control precisely the information and display when you list your containers by filtering and formatting.

Then, you'll get hands-on experience stopping, starting, restarting and attaching to your containers. Finally, you'll run one-off commands as well as gain interactive shell access to a running container.

Before we start, make sure that Docker is installed properly in your environment. Depending on how it installed and your user, you may need to run it as sudo. I'll skip the sudo.

### Listing Containers

When working with containers, you often want to list, view and filter your containers. The `docker ps` command is the key, and it has several interesting options.

#### Running Containers

The most basic command is plain `docker ps` with no arguments, which shows all the currently running containers.

```bash
$ docker ps

CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                           NAMES 2f542e1cb88b        nginx               "nginx -g 'daemon ..."   12 hours ago        Up 12 hours         443/tcp, 0.0.0.0:9000->80/tcp   nginx
```

You get a lot of information on each container, including the container id, the image, the command, when it was created, its current status, its ports, and its names. It's a little difficult to parse due to the wrapping. We'll see later how to filter and format the output. Note that the command is truncated (as well as the container id). To show the full command, add `--no-trunc`:

```bash
$ docker ps --no-trunc
IMAGE   COMMAND
nginx   "nginx -g 'daemon off;'"
```

Now, the full command is visible: `nginx -g 'daemon off;'`

#### All Containers

As you recall, Docker keeps stopped containers around (unless you ran them with `--rm`). Adding `-a` shows all containers:

```bash
$ docker ps -a
CONTAINER ID        IMAGE              STATUS        NAMES
c797c61dc21        busybox             Exited        busybox
67f3cb5a9647       busybox             Exited        ecstatic_jones
898fb562e535       hello-world         Exited        hopeful_spence
6dd210fda2d8       hello-world         Created       infallible_curie
2f542e1cb88b       nginx               Up 12 hours   nginx
```

#### Formatting

The output of `docker ps` can be too verbose and often shows a lot of fields that are not interesting. You can use Go-template formatting to display just the fields you're interested in. Here is showing just the name and the command:

```bash
$ docker ps --no-trunc --format '{{.Names}}\t{{.Command}}'
nginx   "nginx -g 'daemon off;'"
```

That works, but to present it with the field names, add "table" to the beginning of the format string:

```bash
$ docker ps -a --no-trunc --format 'table {{.Names}}\t{{.Command}}'
NAMES               COMMAND
busybox             "cat /data/1.txt"
ecstatic_jones      "cat /data/1.txt"
hopeful_spence      "/hello"
infallible_curie    "ls -la"
nginx               "nginx -g 'daemon off;'"
```

The format name for the container id (not selected here) is `{{.ID}}` (all caps).

#### Filtering

The `docker ps` command supports many filters. They are pretty straightforward to use. The syntax is `-f "<filter>=<value>"`. Supported filters are id, label, name, exited, status, ancestor, before, since, isolation, network, and health.

Here is filtering by container name and showing only the busybox container:

```bash
$ docker ps -a -f "name=busybox" --format 'table {{.ID}}\t{{.Status}}\t{{.Names}}'
CONTAINER ID        STATUS                      NAMES
cc797c61dc21        Exited (0) 11 minutes ago   busybox
```

#### The `-q` Flag

If all you want is the container id, use the `-q flag` (quiet flag). It's simpler than `--format 'table {{.ID}}'`. This is often needed when you want to perform operations on multiple containers (you'll see an example later).

```bash
$ docker ps -aq
cc797c61dc21 67f3cb5a9647 898fb562e535 6dd210fda2d8 2f542e1cb88b
```

#### Stopping, Starting, and Restarting Containers

You can stop running containers and start a stopped container. There are several differences between starting a stopped container and running a new instance of the same image:

- You use the same environment variables, volumes, ports and other arguments of the original run command.
- You don't have to create yet another container.
- If the stopped instance modified its file system, the started container will use the same.

Let's stop the **nginx** container and then start it. When you refer to a container, you can use its name or an unambiguous prefix of its id. I usually name my long-running containers so I have a meaningful handle and don't have to deal with Docker's auto-generated names or containers' id prefixes.

```bash
$ docker stop nginx
nginx

$ docker ps -a -f "name=nginx" --format 'table {{.Names}}\t{{.Status}}'
NAMES               STATUS
nginx               Exited (0) 2 minutes ago
```

OK. Nginx is stopped (status is "Exited"). Let's start it:

```bash
$ docker start nginx
nginx

$ docker ps -a -f "name=nginx" --format 'table {{.Names}}\t{{.Status}}'
NAMES               STATUS
nginx               Up 33 seconds
```

Restarting a running container is another option, which is equivalent to `docker stop` followed by `docker start`.

```bash
$ docker restart nginx
nginx

$ docker ps -a -f "name=nginx" --format 'table {{.Names}}\t{{.Status}}'
NAMES               STATUS
nginx               Up 2 seconds
```

### Attaching to a Running Container

When you start a stopped container, or if you ran your container in detached mode (`-d` command-line argument), you can't see the output. But you can attach to it.

```bash
$ docker attach nginx
172.17.0.1 - - [19/Mar/2017:08:40:03 +0000] "HEAD / HTTP/1.1" 200 0 "-" "HTTPie/0.8.0" "-"
```

### Removing Containers

You can remove stopped containers with the command:  `docker rm <container id or name>`

```bash
$ docker rm ecstatic_jones
ecstatic_jones
```

If you want to remove a running container, you can either stop it first or use the `-f` (force) command-line argument:

```bash
$ docker rm -nginx
Error response from daemon: You cannot remove a running container
3dbffa955f906e427298fbeb3eadfd229d64365dd880c9771a31b0aedb879d6d.
Stop the container before attempting removal or use -f

$ docker rm -f -nginx
nginx
```

If you want to remove all containers, here is a nice snippet:

```bash
docker rm -f $(docker ps -aq)
```

If you want to remove just the stopped container, remove the `-f` (force) flag.

### Executing a Command Inside a Running Container

Docker runs a single process inside a container, but you can execute additional commands against a running container. It is very similar to providing a custom command to the `docker run` command, except that in this case it is running side by side with the run command.

#### Simple Commands

Running a simple command is done via `docker exec`. You provide a running container id or name and the command you wish to execute. Let's check out the **nginx.conf** file inside the **nginx** container and see how many worker processes are configured.

```bash
$ docker exec nginx cat /etc/nginx/nginx.conf | grep worker_processes
worker_processes  1;
```

#### Interactive Shell

One of the best troubleshooting techniques with Docker containers is to connect to an interactive shell and just explore the internal file system. In order to attach **stdin** and have a **tty**, you need to provide the `-i -t` command-line arguments (can be grouped as `-it`) and then the name of a shell executable (usually **bash**).

You end up with shell access to your container. Here is an example of checking the worker processes interactively from "inside" the container.

```bash
$ docker exec -it nginx bash
root@b010e854bb98:/# cat /etc/nginx/nginx.conf | grep worker_processes
worker_processes  1;
root@b010e854bb98:/#
```

### Conclusion: Part 2

Docker is a powerful platform, and since the container is its unit of work, it provides a lot of tools to manage and work with containers. I described most of the important aspects of working with containers, but there are many more advanced features, options and nuances to the commands I covered, as well some additional commands.

If you work closely with Docker containers, take the time to dive in and learn all about them. It will pay off handsomely.

## Credits

Written by **Gigi Sayfan**, **Principal Software Architect at Helix** on  _7 Apr 2017_.

1. [Docker From the Ground Up: Working With Containers, Part 1](https://code.tutsplus.com/tutorials/docker-from-the-ground-up-working-with-containers-part-1--cms-28483)
2. [Docker From the Ground Up: Working With Containers, Part 2](https://code.tutsplus.com/tutorials/docker-from-the-ground-up-working-with-container-part-2--cms-28486)
