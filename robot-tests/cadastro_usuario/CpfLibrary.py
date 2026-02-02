import random

class CpfLibrary:

    def generate_cpf(self):
        def calculate_digit(digs):
            s = sum([(len(digs)+1 - i) * int(d) for i, d in enumerate(digs)])
            r = 11 - s % 11
            return str(r if r < 10 else 0)

        nums = [str(random.randint(0, 9)) for _ in range(9)]
        nums.append(calculate_digit(nums))
        nums.append(calculate_digit(nums))
        return "".join(nums)