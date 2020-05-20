// g++ -std=c++11 rgb_test.cpp -lrealsense2 `pkg-config opencv4 --cflags --libs` -o rgb_test && ./rgb_test

// include the librealsense C++ header file
#include <librealsense2/rs.hpp>

// include OpenCV header file
#include <opencv2/opencv.hpp>

using namespace std;
using namespace cv;

int main()
{
    // Declare depth colorizer for pretty visualization of depth data
    rs2::colorizer color_map;

    //Contruct a pipeline which abstracts the device
    rs2::pipeline pipe;

    //Create a configuration for configuring the pipeline with a non default profile
    rs2::config cfg;

    //Add desired streams to configuration
    cfg.enable_stream(RS2_STREAM_COLOR, 640, 480, RS2_FORMAT_BGR8, 60);
    cfg.enable_stream(RS2_STREAM_DEPTH, 640, 480, RS2_FORMAT_Z16, 60);

    //Instruct pipeline to start streaming with the requested configuration
    pipe.start(cfg);

	namedWindow("RGB Image", WINDOW_AUTOSIZE );
	namedWindow("Depth Image", WINDOW_AUTOSIZE );

    // Camera warmup - dropping several first frames to let auto-exposure stabilize
    rs2::frameset frames;
    for(int i = 0; i < 30; i++)
    {
        //Wait for all configured streams to produce a frame
        frames = pipe.wait_for_frames();
    }

	while (waitKey(1) < 0) 
	{
		//Wait for all configured streams to produce a frame
		frames = pipe.wait_for_frames();

		//Get each frame
		rs2::frame color_frame = frames.get_color_frame();
		rs2::frame depth_frame = frames.get_depth_frame().apply_filter(color_map);

		// Creating OpenCV Matrix from a color image
		Mat color(Size(640, 480), CV_8UC3, (void*)color_frame.get_data(), Mat::AUTO_STEP);
		// Creating OpenCV matrix from Depth image
		Mat depth(Size(640, 480), CV_8UC3, (void*)depth_frame.get_data(), Mat::AUTO_STEP);

		// Display in a GUI
		imshow("RGB Image", color);
		imshow("Depth Image", depth);
	}

    return 0;
}


