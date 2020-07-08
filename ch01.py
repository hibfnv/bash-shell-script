#!/usr/bin/env python
# This python script is used to show system users which can be login in this OS platform.
# For showing the login users and group id.

# For Example Fibonacci number test:
fibs = [0,1]
for i in range(20):
    fibs.append(fibs[-2]+fibs[-1])
    print(fibs)
print("*"*16+" Split Line "+"*"*16)
# ================ Split Line ==================
#
# define a class which named person class.
class person:
    def sname(self,name):
        self.name=name
    def getname(self):
        return self.name
    def greeting(self):
        print("Hello,world! I'm %s." % self.name)
# define t1 as person class
t1=person()
# define t2 as person class
t2=person()
# use setname function for t1
t1.sname('Lorry')
# use setname function for t2
t2.sname('Jimmy')
# use getname function for t1 
print(t1.getname())
# use greeting function for t1
t1.greeting()
# use getname function for t2
print(t2.getname())
# use greeting function for t2
t2.greeting()
# Rebuild the class method for test.
# Use bird and songbird for test in this example.
print("="*15+' Split Line '+"="*16)
class bird:
    def __init__(self):
        self.hungry=True
    def eat(self):
        if self.hungry:
            print('Ahhh....')
            self.hungry=False
        else:
            print('No,thanks.')
# set b as bird class
b=bird()
# feed the bird when it is hungry.
b.eat()
# The second time to feed the bird, but it is full now.
b.eat()
# =============== songbird which it is inherited by bird class =============
class songbird(bird):
    def __init__(self):
        bird.__init__(self)
        self.sound='Squawk!' 
    def sing(self):
        print(self.sound)
# defind sb as class songbird
sb=songbird()
# use sing function for songbird
sb.sing()
# use eat function for songbird first time
sb.eat()
# use eat funciton for songbird second time.
sb.eat()

        
