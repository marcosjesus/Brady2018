using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;
using System.Diagnostics;

namespace WebAgencia
{
    public class AES256
    {

        public static string Encrypt(string keyStr, string text)
        {
            try
            {
                RijndaelManaged AesEncryption = new RijndaelManaged();
                AesEncryption.KeySize = 256; // 192, 256
                AesEncryption.BlockSize = 128;
                AesEncryption.Mode = CipherMode.ECB;
                AesEncryption.Padding = PaddingMode.Zeros;

                byte[] keyArr = Encoding.UTF8.GetBytes(keyStr);
                AesEncryption.Key = keyArr;

                byte[] plainText = ASCIIEncoding.UTF8.GetBytes(text);

                ICryptoTransform crypto = AesEncryption.CreateEncryptor();

                byte[] cipherText = crypto.TransformFinalBlock(plainText, 0, plainText.Length);

                return Converter.ByteArrayToString(cipherText);

            }

            catch (Exception ex)
            {
                return ex.Message;
            }

        }

        public static string Decrypt(string keyStr, string text, int tamanho)
        {

            try
            {

                RijndaelManaged AesEncryption = new RijndaelManaged();
                AesEncryption.KeySize = 256; // 192, 256
                AesEncryption.BlockSize = 128;
                AesEncryption.Mode = CipherMode.ECB;
                AesEncryption.Padding = PaddingMode.Zeros;

                byte[] keyArr = Encoding.UTF8.GetBytes(keyStr);
                AesEncryption.Key = keyArr;

                byte[] cipherText = Converter.StringToByteArray(text);

                ICryptoTransform decrypto = AesEncryption.CreateDecryptor();

                byte[] decryptedText = decrypto.TransformFinalBlock(cipherText, 0, cipherText.Length);

                return ASCIIEncoding.UTF8.GetString(decryptedText).Substring(0, tamanho);

            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }

        public static string Decrypt(string keyStr, string text)
        {
            try
            {
                RijndaelManaged AesEncryption = new RijndaelManaged();
                AesEncryption.KeySize = 256; // 192, 256
                AesEncryption.BlockSize = 128;
                AesEncryption.Mode = CipherMode.ECB;
                AesEncryption.Padding = PaddingMode.Zeros;

                byte[] keyArr = Encoding.UTF8.GetBytes(keyStr);

                AesEncryption.Key = keyArr;

                byte[] cipherText = Converter.StringToByteArray(text);

                ICryptoTransform decrypto = AesEncryption.CreateDecryptor();

                byte[] decryptedText = decrypto.TransformFinalBlock(cipherText, 0, cipherText.Length);

                return ASCIIEncoding.UTF8.GetString(decryptedText);

            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }

        }

    }
}
