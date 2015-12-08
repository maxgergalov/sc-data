package com.test.sceditor.security;

import org.apache.commons.codec.binary.Base64;

import javax.crypto.Cipher;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;

public class TokenEncryptor  {
    private final Base64 base64 = new Base64();
    private Cipher ecipher;
    private Cipher dcipher;

    public TokenEncryptor() throws NoSuchAlgorithmException,
            NoSuchPaddingException, InvalidKeyException {
        Key key = new SecretKeySpec("terabkprewaserpt".getBytes(), "AES");
        this.ecipher = Cipher.getInstance("AES");
        this.dcipher = Cipher.getInstance("AES");
        this.ecipher.init(Cipher.ENCRYPT_MODE, key);
        this.dcipher.init(Cipher.DECRYPT_MODE, key);
    }

    public String encrypt(String plaintext) {
        try {
            return  base64.encodeToString(ecipher.doFinal(plaintext.getBytes("UTF8")));
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public String decrypt(String ciphertext) {
        try {
            return new String(dcipher.doFinal( base64.decode(ciphertext)),"UTF8");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        try {
            String test = new TokenEncryptor().encrypt("test token");
            System.out.println(test);
            System.out.println(new TokenEncryptor().decrypt(test));

        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (NoSuchPaddingException e) {
            e.printStackTrace();
        } catch (InvalidKeyException e) {
            e.printStackTrace();
        }
    }
}