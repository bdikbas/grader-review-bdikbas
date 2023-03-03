CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
git clone $1 student-submission
echo 'Finished cloning'

cd student-submission

if [[ -e ListExamples.java ]]
then
   echo 'File Found'
else
   echo 'FILE NOT FOUND'
   exit
fi

cd ../
cp TestListExamples.java student-submission
cd lib
cp junit-4.13.2.jar student-submission
cp hamcrest-core-1.3.jar student-submission
echo 'transferred'

cd ../student-submission

javac -cp $CPATH *.java
java -cp $CPATH org.junit.runner.JUnitCore TestListExamples
