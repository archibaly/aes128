#ifndef _AES_128_H_
#define _AES_128_H_

#include <stdint.h>

void aes128_ecb_encrypt(uint8_t * input, const uint8_t * key, uint8_t * output);
void aes128_ecb_decrypt(uint8_t * input, const uint8_t * key, uint8_t * output);
void aes128_cbc_encrypt_buffer(uint8_t * output, uint8_t * input,
							   uint32_t length, const uint8_t * key,
							   const uint8_t * iv);
void aes128_cbc_decrypt_buffer(uint8_t * output, uint8_t * input,
							   uint32_t length, const uint8_t * key,
							   const uint8_t * iv);

#endif /* _AES_128_H_ */
