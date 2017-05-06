# ENGR-112-MATLAB-Project
MATLAB Statistical Application

This application is a menu-based tool that calculates relevant statistical information of a data set.
It accepts input from a file and displays various statistical quantities, including mean, median,
and standard deviation. It also creates plots and graphs and allows the user to find probability
distribution. This manual is intended to provide a thorough but concise set of instruction on how
to use the application. The following points give a description of the program’s options.

Set Username

This option allows the user to set his or her username for a more personalized experience. The
user does not have to set a username and is allowed to continue as a guest if desired.

Load Data from File

The user must go through this option in order to receive any statistical information. This option
asks the user to tell the program the input filename that consists of the data set which will be
operated on. The user must input a valid file, or else an invalid filename exception will be
thrown. This filename must have the correct extension, such as ‘.txt’. Since this program allows
the data from the input file to be distributed over 1 or 2 columns, a dialog box will appear that
asks the user how many columns are in their input file.

Clear Data from Memory

Instead of restarting the program, the user may clear the program’s memory; all values will be
reset, including the username that is currently signed in. This is a quick way if the user finds that
he or she wants to load up different input and output files. 

Set Output File Name

The user must go through this option in order to print data to a file. As soon as both input and
output files have been loaded the mean, median, standard deviation, variance, minimum,
maximum, and count values will be output to this file. This is most easily done with a .txt file;
however, the user may find that other filetypes may work. If an output filename already exists in
the directory, all data will be overridden, so it is in the user’s best interest to give an output
filename that does not already exist.

Plot Histogram/Plot Histogram Fit

This function gives the user a histogram of the data set. A histogram shows how many elements
in the set are within several specific ranges. After the user plots a histogram, he or she must then
determine whether or not (in their best judgement) the data is normally distributed. If the user
finds that the data does appear to be normally distributed, the options to find the probability
given x or z values and to find x or z values given probability are unlocked.

Plot Probability Plots

This can be a useful option for the user if probability data is what they’re looking for. Probability
plots determine how likely it is for a data member to have the value on the graph. The denser
areas of the graph mean that more data members are within that range, and that choosing an
element in this range is more likely.

Find Probability Given X or Z

If the user has indicated that the data is normally distributed using the histogram function AND
the output file name is set, this option outputs to that file (and to the command window) the
normal probability given either the specified x or z value that the user learned about in his
statistics class. Upon clicking, the user is prompted with a dialog box that asks if the value to be
entered is an x or z value, and then the user is to input their value. If given and x value, the
program uses it directly, and if given a z value, the program calculates the corresponding x value
and uses that.

Find X or Z Given Probability

This option essentially performs the inverse of the previous option. The user must have already
indicated that the data is normally distributed and the output file set. The user will be prompted
for the numerical value of the probability and then will be asked if she wants an x, z, or both
values. These values will naturally be printed to the output file.

Exit

This option gracefully closes the program.

Testing

This program was developed through extensive testing, mainly to handle any runtime exceptions
that may occur, such as the user entering invalid filenames (or files with invalid data). This is
one of the reasons this application was developed in chunks. Some of examples of this testing
included typing in random characters where a numeric value is asked for and entering an input
filename that does not exist. The developer of this project is convinced that unless purposely
looking for ways to crash his program, it should run smoothly for the average user. 
