#!python

from bases import decode, encode, convert
import unittest


class BasesDecodeTest(unittest.TestCase):

    def test_decode_binary(self):
        assert decode('0', 2) == 0
        assert decode('1', 2) == 1
        assert decode('10', 2) == 2
        assert decode('11', 2) == 3
        assert decode('100', 2) == 4
        assert decode('101', 2) == 5
        assert decode('110', 2) == 6
        assert decode('111', 2) == 7
        assert decode('1000', 2) == 8
        assert decode('1001', 2) == 9
        assert decode('1010', 2) == 10
        assert decode('1011', 2) == 11
        assert decode('1100', 2) == 12
        assert decode('1101', 2) == 13
        assert decode('1110', 2) == 14
        assert decode('1111', 2) == 15

    def test_decode_decimal(self):
        assert decode('5', 10) == 5
        assert decode('9', 10) == 9
        assert decode('10', 10) == 10
        assert decode('25', 10) == 25
        assert decode('64', 10) == 64
        assert decode('99', 10) == 99
        assert decode('123', 10) == 123
        assert decode('789', 10) == 789
        assert decode('2345', 10) == 2345
        assert decode('6789', 10) == 6789
        assert decode('13579', 10) == 13579
        assert decode('24680', 10) == 24680

    def test_decode_hexadecimal(self):
        assert decode('a', 16) == 10
        assert decode('f', 16) == 15
        assert decode('99', 16) == 153
        assert decode('ff', 16) == 255
        assert decode('ace', 16) == 2766
        assert decode('cab', 16) == 3243
        assert decode('bead', 16) == 48813
        assert decode('face', 16) == 64206
        assert decode('c0ffee', 16) == 12648430
        assert decode('facade', 16) == 16435934
        assert decode('deadbeef', 16) == 3735928559
        assert decode('f007ba11', 16) == 4027038225

    def test_decode_10(self):
        assert decode('10', 2) == 2
        assert decode('10', 4) == 4
        assert decode('10', 8) == 8
        assert decode('10', 10) == 10
        assert decode('10', 16) == 16
        assert decode('10', 25) == 25
        assert decode('10', 32) == 32
        assert decode('10', 36) == 36

    def test_decode_1010(self):
        assert decode('1010', 2) == 10
        assert decode('1010', 4) == 68
        assert decode('1010', 8) == 520
        assert decode('1010', 10) == 1010
        assert decode('1010', 16) == 4112
        assert decode('1010', 25) == 15650
        assert decode('1010', 32) == 32800
        assert decode('1010', 36) == 46692

    def test_decode_101101(self):
        assert decode('101101', 2) == 45
        assert decode('101101', 4) == 1105
        assert decode('101101', 8) == 33345
        assert decode('101101', 10) == 101101
        assert decode('101101', 16) == 1052929
        assert decode('101101', 25) == 9781876
        assert decode('101101', 32) == 33588225
        assert decode('101101', 36) == 60514129


class BasesEncodeTest(unittest.TestCase):

    def test_encode_binary(self):
        # assert encode(0, 2) == '0'  # Should '' be valid?
        assert encode(1, 2) == '1'
        assert encode(2, 2) == '10'
        assert encode(3, 2) == '11'
        assert encode(4, 2) == '100'
        assert encode(5, 2) == '101'
        assert encode(6, 2) == '110'
        assert encode(7, 2) == '111'
        assert encode(8, 2) == '1000'
        assert encode(9, 2) == '1001'
        assert encode(10, 2) == '1010'
        assert encode(11, 2) == '1011'
        assert encode(12, 2) == '1100'
        assert encode(13, 2) == '1101'
        assert encode(14, 2) == '1110'
        assert encode(15, 2) == '1111'

    def test_encode_decimal(self):
        # assert encode(0, 10) == '0'  # Should '' be valid?
        assert encode(5, 10) == '5'
        assert encode(10, 10) == '10'
        assert encode(25, 10) == '25'
        assert encode(64, 10) == '64'
        assert encode(99, 10) == '99'
        assert encode(123, 10) == '123'
        assert encode(789, 10) == '789'
        assert encode(2345, 10) == '2345'
        assert encode(6789, 10) == '6789'
        assert encode(13579, 10) == '13579'
        assert encode(24680, 10) == '24680'

    def test_encode_hexadecimal(self):
        assert encode(10, 16) == 'a'
        assert encode(15, 16) == 'f'
        assert encode(153, 16) == '99'
        assert encode(255, 16) == 'ff'
        assert encode(2766, 16) == 'ace'
        assert encode(3243, 16) == 'cab'
        assert encode(48813, 16) == 'bead'
        assert encode(64206, 16) == 'face'
        assert encode(12648430, 16) == 'c0ffee'
        assert encode(16435934, 16) == 'facade'
        assert encode(3735928559, 16) == 'deadbeef'
        assert encode(4027038225, 16) == 'f007ba11'

    def test_encode_1234(self):
        assert encode(1234, 2) == '10011010010'
        assert encode(1234, 3) == '1200201'
        assert encode(1234, 4) == '103102'
        assert encode(1234, 5) == '14414'
        assert encode(1234, 8) == '2322'
        assert encode(1234, 10) == '1234'
        assert encode(1234, 16) == '4d2'
        assert encode(1234, 32) == '16i'

    def test_encode_248975(self):
        assert encode(248975, 2) == '111100110010001111'
        assert encode(248975, 4) == '330302033'
        assert encode(248975, 8) == '746217'
        assert encode(248975, 10) == '248975'
        assert encode(248975, 16) == '3cc8f'
        assert encode(248975, 25) == 'fn90'
        assert encode(248975, 32) == '7j4f'
        assert encode(248975, 36) == '5c3z'

    def test_encode_into_10(self):
        assert encode(2, 2) == '10'
        assert encode(4, 4) == '10'
        assert encode(8, 8) == '10'
        assert encode(10, 10) == '10'
        assert encode(16, 16) == '10'
        assert encode(25, 25) == '10'
        assert encode(32, 32) == '10'
        assert encode(36, 36) == '10'

    def test_encode_into_1010(self):
        assert encode(10, 2) == '1010'
        assert encode(68, 4) == '1010'
        assert encode(520, 8) == '1010'
        assert encode(1010, 10) == '1010'
        assert encode(4112, 16) == '1010'
        assert encode(15650, 25) == '1010'
        assert encode(32800, 32) == '1010'
        assert encode(46692, 36) == '1010'

    def test_encode_into_101101(self):
        assert encode(45, 2) == '101101'
        assert encode(1105, 4) == '101101'
        assert encode(33345, 8) == '101101'
        assert encode(101101, 10) == '101101'
        assert encode(1052929, 16) == '101101'
        assert encode(9781876, 25) == '101101'
        assert encode(33588225, 32) == '101101'
        assert encode(60514129, 36) == '101101'


class BasesConvertTest(unittest.TestCase):

    def test_convert_from_binary(self):
        assert convert('1101', 2, 3) == '111'
        assert convert('1101', 2, 4) == '31'
        assert convert('1101', 2, 8) == '15'
        assert convert('1101', 2, 10) == '13'
        assert convert('101010', 2, 3) == '1120'
        assert convert('101010', 2, 4) == '222'
        assert convert('101010', 2, 8) == '52'
        assert convert('101010', 2, 10) == '42'
        assert convert('101010', 2, 16) == '2a'
        assert convert('101010', 2, 25) == '1h'
        assert convert('101010', 2, 32) == '1a'
        assert convert('101010', 2, 36) == '16'

    def test_convert_to_binary(self):
        assert convert('111', 3, 2) == '1101'
        assert convert('31', 4, 2) == '1101'
        assert convert('15', 8, 2) == '1101'
        assert convert('13', 10, 2) == '1101'
        assert convert('101', 3, 2) == '1010'
        assert convert('101', 4, 2) == '10001'
        assert convert('101', 8, 2) == '1000001'
        assert convert('101', 10, 2) == '1100101'
        assert convert('101', 16, 2) == '100000001'
        assert convert('101', 25, 2) == '1001110010'
        assert convert('101', 32, 2) == '10000000001'
        assert convert('101', 36, 2) == '10100010001'

    def test_convert_hexadecimal_to_decimal(self):
        assert convert('a', 16, 10) == '10'
        assert convert('f', 16, 10) == '15'
        assert convert('99', 16, 10) == '153'
        assert convert('ff', 16, 10) == '255'
        assert convert('ace', 16, 10) == '2766'
        assert convert('cab', 16, 10) == '3243'
        assert convert('bead', 16, 10) == '48813'
        assert convert('face', 16, 10) == '64206'
        assert convert('c0ffee', 16, 10) == '12648430'
        assert convert('facade', 16, 10) == '16435934'
        assert convert('deadbeef', 16, 10) == '3735928559'
        assert convert('f007ba11', 16, 10) == '4027038225'

    def test_convert_decimal_to_hexadecimal(self):
        assert convert('10', 10, 16) == 'a'
        assert convert('15', 10, 16) == 'f'
        assert convert('153', 10, 16) == '99'
        assert convert('255', 10, 16) == 'ff'
        assert convert('2766', 10, 16) == 'ace'
        assert convert('3243', 10, 16) == 'cab'
        assert convert('48813', 10, 16) == 'bead'
        assert convert('64206', 10, 16) == 'face'
        assert convert('12648430', 10, 16) == 'c0ffee'
        assert convert('16435934', 10, 16) == 'facade'
        assert convert('3735928559', 10, 16) == 'deadbeef'
        assert convert('4027038225', 10, 16) == 'f007ba11'

    def test_convert_hexadecimal_to_binary(self):
        assert convert('a', 16, 2) == '1010'
        assert convert('b', 16, 2) == '1011'
        assert convert('c', 16, 2) == '1100'
        assert convert('d', 16, 2) == '1101'
        assert convert('e', 16, 2) == '1110'
        assert convert('f', 16, 2) == '1111'
        assert convert('c840', 16, 2) == '1100100001000000'
        assert convert('d951', 16, 2) == '1101100101010001'
        assert convert('ea62', 16, 2) == '1110101001100010'
        assert convert('fb73', 16, 2) == '1111101101110011'

    def test_convert_binary_to_hexadecimal(self):
        assert convert('1010', 2, 16) == 'a'
        assert convert('1011', 2, 16) == 'b'
        assert convert('1100', 2, 16) == 'c'
        assert convert('1101', 2, 16) == 'd'
        assert convert('1110', 2, 16) == 'e'
        assert convert('1111', 2, 16) == 'f'
        assert convert('1100100001000000', 2, 16) == 'c840'
        assert convert('1101100101010001', 2, 16) == 'd951'
        assert convert('1110101001100010', 2, 16) == 'ea62'
        assert convert('1111101101110011', 2, 16) == 'fb73'


if __name__ == '__main__':
    unittest.main()
