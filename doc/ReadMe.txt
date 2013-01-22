# $Id$


Contents:
=========

- Overview
- Why use ftpsync instead of mirror, sitecopy, ...?
- Why NOT use ftpsync, but rather ... (Security Disclaimer)
- Requirements/restrictions
- Bug reports, contact
- License
- Updates
- Thanks


Overview:
---------

ftpsync.pl synchronizes a local directory tree and a remote FTP directory tree.

Initially it was written to automate web publishing, but might be useful for
some other purposes, like mirroring not-too-large public sites, data
replication, and more.

Call "ftpsync.pl -h" to get a short parameter explanation.


Why use ftpsync.pl instead of mirror, sitecopy, ...?
----------------------------------------------------

Yes, there are similar projects, hence some comments on them:

Compared to mirror, ftpsync.pl is capable of PUTting, not only GETting stuff.
(Don't blame me if mirror is able to PUT, I couldn't find a way.)

Compared to sitecopy, if the remote site was changed by other tools and/or activites since the previous run of the synchronization tool, ftpsync.pl doesn't get a hard time. Unless network problems occur or bugs come into action, ftpsync.pl does a synchronizes reliably.

Compared to both tools, ftpsync.pl is very lightweight. ;-))


Why NOT use ftpsync, but rather ... (Security Disclaimer)
---------------------------------------------------------

FTP is an almost ancient file transport protocol. It has two major flaws:

1. It is difficult to run FTP through NAT routers, because of the use of session specific ports on which the server wants to connect to the client.
With providers running out of IPv4 addresses and IPv6 growing very slowly, NAT-ing is very common.
Using passive mode (passive FTP) usually works through NAT routers, but it may fail sometimes.

2. When FTP was born, transport layer security was no issue. Common FTP transfers all data, including passwords (!) in plain text and must therefore be considered VERY INSECURE!
Therefore users are encouraged to use a secure alternative. 
Secure alternatives include:
- rsync over SSH (recommended)
- SFTP (FTP over SSH)
- FTPS (FTP with SSL) which is at the top of ftpsync's wish list


Requirements / Restrictions:
----------------------------

- Perl 5.6+
  ftpsync.pl was initially developed on Perl 5.6.0-81 on SuSE Linux 7.2,
  older Perl 5.x version might work.

- File::Find, IO::Handle, Net::FTP
  Usually parts of the basic perl package.

- File::Listing
  Part of the libwww-perl package.
  
- UNIX like operating systems on local system
  Porting to DOS based systems should be easily done by changing the
  directory separator.
  
- Perhaps, the script does not work with all FTP servers.
  It is being tested only against UNIX based FTP servers.


ftpsync-ssl and it's additional requirements:
---------------------------------------------

ftpsync-ssl is an experimental ftpsync variant with support for (FTP with SSL).

For now it lives besides the ftpsync binary because it uses Net::FTPSSL which 
- seems to have stopped maturing in 2005, 
- can be difficult to install,
- produces weird warning messages when used by an application,
- has an API that is slightly but inconveniently different from Net::FTP's.

The additional requirements for ftpsync-ssl are:
- Net::Cmd, usually part of the basic perl package.
- Net::SSLeay::Handle, part of the libnet-ssleay-perl package.
- IO::Socket::SSL, part of the libio-socket-ssl-perl package.
- Net::FTPSSL from CPAN, try calling cpan Net::FTPSSL


Homepage:
---------------------

Old Homepage:
  http://www.clazzes.org/ftpsync

New Homepage (not really complete yet):
  https://savannah.gnu.org/projects/ftpsync/


License:
--------

FTPSync.pl is GNU/GPL software.


FTPSync.pl as GNU/GPL software:
-------------------------------

FTPSync.pl (ftpsync.pl) is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

See attached file License.txt.


Download and Updates
--------------------

FTPSync 1.3.06 is available from:
  https://download.clazzes.org/ftpsync
  https://deb.clazzes.org/

Current sourcecode is, and new packages will be available from:
  https://savannah.gnu.org/projects/ftpsync/


Thanks
------

Thanks to all who have provided comments and enhancements.

Namely (in order of versions affected):

- Christoph Lechleitner <christoph.lechleitner@iteg.at> (Original Author)

- Michiel Steltman <Msteltman@disway.nl> (provided 1.24)

- Samuel Marshall <sam@leafdigital.com> (provided most of 1.27)

- Elias Bröms http://www.eliasit.se/ (provided 1.28)

- Brian Drawert <brian@deadtide.com> (proposed 1.29)

- Niklas Therning http://therning.org/niklas (proposed 1.2.30)

- Ronnie T. Moore http://alwayswebhosting.com/ (typo hint leading to 1.2.31)

- Brian Drawert <brian@deadtide.com> (provided 1.2.32)

- Jose A. Otero <gcervi@gmail.com> (proposed 1.2.33)

- Wolfram Sieber <wolfram.r.sieber@gmail.com> (enhanced this README, 1.2.34)

- Peter Bohn <PeterBohn@gmx.net> (proposed MD5 feature, refused)

- Alexander Klein <a.klein@ageless.de> (-t feature, 1.2.34)

- Isak Johnsson <isak@hypergene.com> (proposed code patches for 1.3.00)

- Stephan Hoehrmann <stephan@hoehrmann.de> (proposed .netrc patch for 1.3.02)

- Brandon Ooi <booi@crunchyroll.com> (proposed a patch for 1.3.03)

- Jonathan Trachtenberg <j.trachtenberg@gmail.com> (proposed agile mode for 1.3.03)

- Ole Tange <tange@gnu.org> (project lead since moving ftpsync 1.3.06 to gnu.org)

