from django.contrib.auth.hashers import UnsaltedMD5PasswordHasher
from django.utils.crypto import (
    constant_time_compare, get_random_string, pbkdf2,
)
class DoubleMD5PasswordHasher(UnsaltedMD5PasswordHasher):
    algorithm = 'double_md5'
    def encode(self,password,salt):
        md5_hash = UnsaltedMD5PasswordHasher().encode(password,'')
        return UnsaltedMD5PasswordHasher().encode(md5_hash,'')
    def verify(self,password,encoded):
        encoded = encoded.split('$')[-1]
        encoded_2 = self.encode(password, '')
        return constant_time_compare(encoded, encoded_2)
