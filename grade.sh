#Used to test Student Example
CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

#Resets and makes sure it's a fresh check
rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission

#Checks to see if the file exists
if [[ -e ListExamples.java ]]
then
   echo 'FILE FOUND'
else
   echo 'FILE NOT FOUND'
   exit
fi

#Used to copy the tests into one file in order to test the students file
cd ../
cp TestListExamples.java student-submission
cd lib
cp junit-4.13.2.jar student-submission
cp hamcrest-core-1.3.jar student-submission
echo 'READY TO TEST'

cd ../student-submission

#Test the file
javac -cp $CPATH *.java
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples
