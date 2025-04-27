# Easy Web Loader for Godot

Easy HTML Web Loader for Godot is a very simple plugin used for your web builds
which allows you to customize your HTML loading screen, with only 2 images.  Here are some highlights:
	
- includes a custom HTML shell template.
- forces user to click the so that browser is allowed to enable audio and full screen.
- loading screen and progress bar show loading progress.
- progress bar color, and loading screen background color can be modified in the included custom HTML shell template.
- use you own images to customize the HTML loading process.

## Why is a plugin needed?

Godot by default will export all assets (including images) into the a PCK file.  Therefore your images will not be avaiable to HTML using a simple <img> tag. So how do you add custom images to support a custom html shell?  Well you need to copy the loader images over AFTER export.  A lot of custom Godot placeholder variables are processed in the custom html shell which further complicates the simple use case of custom loader images.

This plugin makes this whole process easy and simple.  All you need to provide is 2 custom loader images and the plugin handles the copying over of the files and the processing of the provided custom html template.

## Audience

This plugin is for developers who are familiar with exporting thier projects to the Web.
If you need help in exporting your game to the web, see the official Godot [Exporting for Web](https://docs.godotengine.org/en/stable/tutorials/export/exporting_for_web.html) documentation.

## Limitations

- only single thread exports supported.
- only `Export Project` option supported (no PCK/ZIP)
- you custom images have to be PNG format.
- your custom images are recommened to be 1280x720 or smaller.

## Video

If you hate reading and rather watch a video on how to install and configure this plugin, click here.

## Installation

- Download this repository as a ZIP file.
- Extract the ZIP file.
- Copy the `addons` directory from the extracted ZIP file into your Godot project's `res://` filesystem.
- Go to `Project > Project Settings > Plugins` and enable.

<img src="https://github.com/antzGames/Easy-Web-Loader/blob/main/demo/images/install_plugin.jpg" width="50%" height="50%">

## Setting up Web Export

- Go to `Project > Export`
- Add the Web template to the presets.
- In the Custom HTML Shell field, add `res://addons/easy_web_loader/html/index_template.html`
- Export. 

<img src="https://github.com/antzGames/Easy-Web-Loader/blob/main/demo/images/web_export_set_shell.jpg" width="50%" height="50%">

## Adding your images

There are two PNG images that you need to have ready.  Both are recommended to be 1280x720 or smaller.

- The first image needs to be renamed `clickme.png` in lower case.
- The second image needs to be renamed `loading.png` in lower case.

The `clickme.png` needs to have a message on it requesting the user to click the image.
This user click is important as it allows the browser to now play audio and allow
fullscreen mode.

Once the user has clicked the `clickme.png` image, then the image is swapped to the
`loading.png` image and the progress bar is now shown.  To change the progress bar color see the next section.

Once the loading of the game happens, the Godot Engine will start running your game.

### Replace the 2 PNG files with your own

Replace the `clickme.png` and `loading.png` in the `res://addons/easy_web_loader/html` folder, as shown below, with your own images, and make sure they have the same name in lower case.

<img src="https://github.com/antzGames/Easy-Web-Loader/blob/main/demo/images/plugin_dir_structure.jpg" width="50%" height="50%">

## Modifying colors

This section is slightly advance as it requires you to modify the included 
Custom HTML Shell.  If you mess up, dont worry, just re-install this plugin and
you are back to where you started.

The Custom HTML Shell is located here: `res://addons/easy_web_loader/html/index_template.html`

The Godot editor hides HTML files for some reason so you need to edit this file
using an external editor.

### Loading Screen backgroud color

You can change the background color of the loading screen, modify this section in 
the Custom HTML Shell:
	
```html
<style>
	body {
		touch-action: none;
		margin: 0;
		border: 0 none;
		padding: 0;
		text-align: center;
		background-color: black;  /* change background color */
	}
```
### Progress Bar color

You can change the background color of the progress, modify this section in 
the Custom HTML Shell:
	
```html
	/* change the built in browser progress color */
	progress {
		accent-color: #e44033
	}
```

## Demo

I have included a Demo scene in this repository.  It is used to test if 
everything works.

## License

MIT License

Copyright (c) 2025 Antz

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
