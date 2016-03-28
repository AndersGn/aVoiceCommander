#!/usr/bin/python
import RPi.GPIO as io

io.setmode(io.BCM)
in1_pin1 = 27
in2_pin1 = 22
in1_pin2 = 20
in2_pin2 = 21

io.setup(in1_pin1, io.OUT)
io.setup(in2_pin1, io.OUT)
io.setup(in1_pin2, io.OUT)
io.setup(in2_pin2, io.OUT)

def forward():
    io.output(in1_pin1, True)#Output a 3.3 volt signal out on in1_pin1 (this is GPIO 27)
    io.output(in2_pin1, False)#Output 0 volts out on in2_pin1 (this is GPIO 22)
    io.output(in1_pin2, True)#Output a high voltage out on in1_pin2 (this is GPIO 20)
    io.output(in2_pin2, False)#Output 0 volts out on in2_pin2 (this is GPIO 21)

def reverse():
    io.output(in1_pin1, False)#Output 0 volts out on in1_pin1 (this is GPIO 27)
    io.output(in2_pin1, True)#Output a high voltage out on in2_pin1 (this is GPIO 22)
    io.output(in1_pin2, False)#Output 0 volts out on in1_pin2 (this is GPIO 20)
    io.output(in2_pin2, True)#Output a high voltage out on in2_pin2 (this is GPIO 21)

def stop():
    io.output(in1_pin1, False)#Output 0 volts out on in1_pin1 (this is GPIO 27)
    io.output(in2_pin1, False)#Output 0 volts out on in2_pin1 (this is GPIO 22)
    io.output(in1_pin2, False)#Output 0 volts out on in1_pin2 (this is GPIO 20)
    io.output(in2_pin2, False)#Output 0 volts out on in2_pin2 (this is GPIO 21)

while True:
    cmd = raw_input("Enter f (forward) or r (reverse) or s (stop): ")#Enter a character for what you want the robot to do
    direction = cmd[0]#Take just the first character of the input
    if direction == "f":
        forward()
    if direction == "r":
        reverse()
    if direction == "s":
        stop()
