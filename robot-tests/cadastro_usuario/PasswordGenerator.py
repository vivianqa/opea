import random
import string

class PasswordGenerator:

    def generate_password(self, length=8):
        if length < 8:
            raise ValueError("A senha deve ter no mínimo 8 caracteres.")

        # Definindo os grupos de caracteres
        lower_case = string.ascii_lowercase
        upper_case = string.ascii_uppercase
        digits = string.digits
        special_characters = string.punctuation

        # Garantindo que a senha contenha pelo menos uma de cada categoria
        password = [
            random.choice(lower_case),
            random.choice(upper_case),
            random.choice(digits),
            random.choice(special_characters)
        ]

        # Preenchendo o restante da senha até o comprimento desejado
        password += random.choices(lower_case + upper_case + digits + special_characters, k=length - 4)

        # Embaralhando a senha gerada
        random.shuffle(password)

        # Retorna a senha gerada como uma string
        return ''.join(password)
