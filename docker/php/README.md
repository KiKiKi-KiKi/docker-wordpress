# Docker wordpress

- https://hub.docker.com/_/wordpress
- https://github.com/docker-library/wordpress/blob/5030ca3fd44f7d5e943200bce0b7dd64f871d5b2/beta/php8.1/

# WordPress Server environment

cf. https://make.wordpress.org/hosting/handbook/server-environment/#php-extensions

## PHP Extensions

WordPress core makes use of various PHP extensions when they’re available. If the preferred extension is missing WordPress will either have to do more work to do the task the module helps with or, in the worst case, will remove functionality.

The PHP extensions listed below are required for a WordPress site to work.

- `json` (bundled in >=8.0.0) – Used for communications with other servers and processing data in JSON format.
- One of either `mysqli` (bundled in >=5.0.0), or `mysqlnd` – Connects to MySQL for database interactions.


The PHP extensions listed below are highly recommended in order to allow WordPress to operate optimally and to maximise compatibility with many popular plugins and themes.

- `curl` (requires libcurl) – Performs remote request operations.
- `dom` (requires libxml) – Used to validate Text Widget content and to automatically configure IIS7+.
- `exif` (requires php-mbstring) – Works with metadata stored in images.
- `fileinfo` – Used to detect mimetype of file uploads.
- `hash` (bundled in >=5.1.2) – Used for hashing, including passwords and update packages.
- `imagick` (requires ImageMagick >= 6.2.4 and php-imagick) – Provides better image quality for media uploads. See WP_Image_Editor for details. Smarter image resizing (for smaller images) and PDF thumbnail support, when Ghost Script is also available.
- `mbstring` – Used to properly handle UTF8 text.
- `openssl` (PHP 7.0 requires OpenSSL >= 0.9.8; PHP >= 7.1.0 requires OpenSSL >= 1.0.1; PHP >= 8.1 requires OpenSSL >= 3.0) – Permits SSL-based connections to other hosts.
- `pcre` – Increases performance of pattern matching in code searches.
- `xml` (requires libxml) – Used for XML parsing, such as from a third-party site.
- `zip` (requires libzip >= 0.11) – Used for decompressing Plugins, Themes, and WordPress update packages.


The PHP extensions listed below are recommended to allow some WordPress cache (if necessary).

- `memcached` (requires libmemcached – PHP >=5.2.0 requires libmemcached >=0.2.0) – memcached is a high-performance, distributed memory object caching system, generic in nature, but intended for use in speeding up dynamic web applications by alleviating database load.
- `opcache` (requires libcurl) – PHP can be configured to preload scripts into the opcache when the engine starts.
- `redis` – PHP extension for interfacing with Redis

For the sake of completeness, below is a list of the remaining PHP modules WordPress may use in certain situations or if other modules are unavailable. These are fallbacks or optional and not necessarily needed in an optimal environment, but installing them won’t hurt.

- `bc` – For arbitrary precision mathematics, which supports numbers of - `any` size and precision up to 2147483647 decimal digits.
- `filter` – Used for securely filtering user input.
- `image` (requires libgd >=2.1.0) – If Imagick isn’t installed, the GD Graphics Library is used as a functionally limited fallback for image manipulation.
- `iconv` (requires libiconv/POSIX) – Used to convert between character sets.
- `intl` (bundled in >=5.3.0) – Enable to perform locale-aware operations including but not limited to formatting, transliteration, encoding conversion, calendar operations, conformant collation, locating text boundaries and working with locale identifiers, timezones and graphemes.
- `simplexml` (requires libxml) – Used for XML parsing.
- `sodium` – (requires libsodium >=1.0.8 or bundled in >=7.2.0) – Validates Signatures and provides securely random bytes.
- `xmlreader` (requires libxml) – Used for XML parsing.
- `zlib` (requires zlib >=1.2.0.4) – Gzip compression and decompression.


These extensions are used for file changes, such as updates and plugin/theme installation, when files aren’t writeable on the server.

- `ssh2` (requires OpenSSL and libssh >=1.2.9) – Provide access to resources (shell, remote exec, tunneling, file transfer) on a remote machine using a secure cryptographic transport.
- `ftp` – Implement client access to files servers speaking the File Transfer Protocol (FTP).
- `sockets` – Implements a low-level interface to the socket communication functions based on the popular BSD sockets.
