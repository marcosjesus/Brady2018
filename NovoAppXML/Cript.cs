using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Security.Cryptography;
using System.IO;

namespace WebAgencia
{
    public class Cript
    {

        public bool DecryptData(String HexEncryptedData, String HexKey, String HexIV, ref string HexDecryptKey)
        {
            byte[] baData = Converter.StringToByteArray(HexEncryptedData);
            byte[] baKey = Converter.StringToByteArray(HexKey);
            byte[] baIV = Converter.StringToByteArray(HexIV);
            byte[] baDecryptKey = null;

            DecryptData(baData, baKey, baIV, ref baDecryptKey);

            HexDecryptKey = Converter.ByteArrayToString(baDecryptKey);

            return true;
        }

        public bool DecryptData(byte[] byteArrayEncryptedData, byte[] Key, byte[] IV, ref byte[] byteArrayDecryptKey)
        {
            if (byteArrayEncryptedData == null || byteArrayEncryptedData.Length <= 0)
                throw new ArgumentNullException("ByteArray");

            if (Key == null || Key.Length <= 0)
                throw new ArgumentNullException("Key");

            if (IV == null || IV.Length <= 0)
                throw new ArgumentNullException("IV");

            try
            {

                MemoryStream ms = new MemoryStream();
                Rijndael alg = Rijndael.Create();
                alg.KeySize = 256;
                alg.Mode = CipherMode.ECB;
                alg.BlockSize = 128;
                alg.Key = Key;
                alg.IV = IV;

                CryptoStream cs = new CryptoStream(ms, alg.CreateDecryptor(), CryptoStreamMode.Write);
                cs.Write(byteArrayEncryptedData, 0, byteArrayEncryptedData.Length);
                cs.Close();

                byteArrayDecryptKey = ms.ToArray();

                return true;

            }
            catch (Exception ex)
            {
                throw new ApplicationException(ex.Message);
            }
        }

        public void Cripth()
        {

            RijndaelManaged AesEncryption = new RijndaelManaged();
            string plainStr = "34360000000000000000000000000000";
            AesEncryption.KeySize = 256;
            AesEncryption.BlockSize = 128;
            AesEncryption.Mode = CipherMode.ECB;
            AesEncryption.Padding = PaddingMode.Zeros;

            string keyStr = "476C6F62616C4E65744040446573656E766F6C76696D656E746F404033383040";
            string ivStr = "00000000000000000000000000000000";

            byte[] keyArr = Converter.StringToByteArray(keyStr);
            byte[] ivArr = Converter.StringToByteArray(ivStr);

            AesEncryption.IV = ivArr;
            AesEncryption.Key = keyArr;

            byte[] plainText = ASCIIEncoding.UTF8.GetBytes(plainStr);

            ICryptoTransform crypto = AesEncryption.CreateEncryptor();
            ICryptoTransform decrypto = AesEncryption.CreateDecryptor();
            byte[] cipherText = crypto.TransformFinalBlock(plainText, 0, plainText.Length);
            byte[] decryptedText = decrypto.TransformFinalBlock(cipherText, 0, cipherText.Length);

            Console.Write("The plain text\"{0}\" in the encrypted format is:{1} \n", plainStr, Convert.ToBase64String(cipherText));
            Console.Write("The encrypted text \"{0}\" is decrypted to: {1}", Convert.ToBase64String(cipherText), ASCIIEncoding.UTF8.GetString(decryptedText));
            Console.Read();
        }
    }
}
