#include <openssl/ssl.h>
#include <openssl/err.h>
#include <iostream>

int main()
{
    SSL_library_init();
    SSL_load_error_strings();

    SSL_CTX* ctx = SSL_CTX_new(TLS_client_method());

    SSL* ssl = SSL_new(ctx);

    std::cout << "OpenSSL version: " << SSLeay_version(SSLEAY_VERSION) << std::endl;

    SSL_CTX_free(ctx);
    SSL_free(ssl);

    return 0;
}


