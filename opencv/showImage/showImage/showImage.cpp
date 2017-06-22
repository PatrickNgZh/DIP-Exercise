#include<opencv2\opencv.hpp>
using namespace cv;
int main() {
	Mat oriImage = imread("lena.ppm");
	imshow("original", oriImage);
	waitKey(0);
	return 0;
}