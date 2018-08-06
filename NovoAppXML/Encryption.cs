using System;
using System.Text;
using System.Security.Cryptography;
using System.IO;

namespace WebAgencia
{
    public class TesteAES
    {

        public byte[] Decrypt(byte[] B, String PSW)
        {

            System.Security.Cryptography.PasswordDeriveBytes pdb = new System.Security.Cryptography.PasswordDeriveBytes(PSW, new Byte[] { 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 });
            System.IO.MemoryStream ms = new System.IO.MemoryStream();
            System.Security.Cryptography.Aes AESE = new System.Security.Cryptography.AesManaged();

            AESE.Key = pdb.GetBytes(AESE.KeySize / 8);
            AESE.IV = pdb.GetBytes(AESE.BlockSize / 8);

            System.Security.Cryptography.CryptoStream cs = new System.Security.Cryptography.CryptoStream(ms, AESE.CreateDecryptor(), System.Security.Cryptography.CryptoStreamMode.Write);

            cs.Write(B, 0, B.Length);

            cs.Close();

            return ms.ToArray();

        }


    }
    public class Encryption
    {
        /// <summary> 
        /// Encrypt the data 
        /// </summary>
        /// <param name="input">String to encrypt</param>
        /// <returns>Encrypted string</returns>
        public static string Encrypt(string input, string password)
        {

            byte[] utfData = UTF8Encoding.UTF8.GetBytes(input);
            byte[] saltBytes = Encoding.UTF8.GetBytes(password);
            string encryptedString = string.Empty;
            using (AesManaged aes = new AesManaged())
            {
                Rfc2898DeriveBytes rfc = new Rfc2898DeriveBytes(password, saltBytes);

                aes.BlockSize = aes.LegalBlockSizes[0].MaxSize;
                aes.KeySize = aes.LegalKeySizes[0].MaxSize;
                aes.Key = rfc.GetBytes(aes.KeySize / 8);
                aes.IV = rfc.GetBytes(aes.BlockSize / 8);

                using (ICryptoTransform encryptTransform = aes.CreateEncryptor())
                {
                    using (MemoryStream encryptedStream = new MemoryStream())
                    {
                        using (CryptoStream encryptor =
                        new CryptoStream(encryptedStream, encryptTransform, CryptoStreamMode.Write))
                        {
                            encryptor.Write(utfData, 0, utfData.Length);
                            encryptor.Flush();
                            encryptor.Close();

                            byte[] encryptBytes = encryptedStream.ToArray();
                            encryptedString = Convert.ToBase64String(encryptBytes);
                        }
                    }
                }
            }
            return encryptedString;
        }

        /// <summary> 
        /// Decrypt a string 
        /// </summary>
        /// <param name="input">Input string in base 64 format</param>
        /// <returns>Decrypted string</returns>
        public static string Decrypt(string input, string password)
        {

            byte[] encryptedBytes = Convert.FromBase64String(input);
            byte[] saltBytes = Encoding.UTF8.GetBytes(password);
            string decryptedString = string.Empty;
            using (var aes = new AesManaged())
            {
                Rfc2898DeriveBytes rfc = new Rfc2898DeriveBytes(password, saltBytes);
                aes.BlockSize = aes.LegalBlockSizes[0].MaxSize;
                aes.KeySize = aes.LegalKeySizes[0].MaxSize;
                aes.Key = rfc.GetBytes(aes.KeySize / 8);
                aes.IV = rfc.GetBytes(aes.BlockSize / 8);

                using (ICryptoTransform decryptTransform = aes.CreateDecryptor())
                {
                    using (MemoryStream decryptedStream = new MemoryStream())
                    {
                        CryptoStream decryptor =
                        new CryptoStream(decryptedStream, decryptTransform, CryptoStreamMode.Write);
                        decryptor.Write(encryptedBytes, 0, encryptedBytes.Length);
                        decryptor.Flush();
                        decryptor.Close();

                        byte[] decryptBytes = decryptedStream.ToArray();
                        decryptedString =
                        UTF8Encoding.UTF8.GetString(decryptBytes, 0, decryptBytes.Length);
                    }
                }
            }

            return decryptedString;
        }

    }
}
