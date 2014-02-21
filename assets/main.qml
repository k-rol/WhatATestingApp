/*
 * Copyright (c) 2011-2013 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.2
import bb.multimedia 1.0

TabbedPane {
    
    Tab {
        title: "QSettings"
        Page {
            Container {
                //Todo: fill me with QML
                Label {
                    // Localized text with the dynamic translation and locale updates support
                    text: qsTr("Hello QSettings") + Retranslate.onLocaleOrLanguageChanged
                    textStyle.base: SystemDefaults.TextStyles.BigText
                    textStyle.color: Color.DarkRed
                }
                Button {
                    text: "SaveMe"
                    onClicked: {
                        settings.setSettings("Test",savedtext.text)
                    }
                }
                TextField {
                    id: savedtext
                    hintText: "nothin"
                }
                
                Button {
                    text: "LoadMe"
                    onClicked: {
                        loadedtext.setText(settings.getSettings("Test"))
                    }
                }
                TextField {
                    id: loadedtext
                    hintText: "nothin"
                }
            }
        }
    }
    Tab {
        title: "video"
        Page {
            Container {
                layout: StackLayout {

                }

                attachedObjects:[
                    MediaPlayer {
                        id: vidPlayer
                        //sourceUrl: "asset:///The_Marshmallow_Test_medium.mp4"
                        sourceUrl: "http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8"
                        videoOutput: VideoOutput.PrimaryDisplay
                        
                        // The name of the window to create
                        windowId: fwcVideoSurface.windowId
                    
                    
                    }
                ]
                
                ForeignWindowControl {
                    id: fwcVideoSurface
                    windowId: "myVideoSurface"
                    
                    updatedProperties: WindowProperty.Size |
                    WindowProperty.Position |
                    WindowProperty.Visible
                    
                    preferredWidth: 1280
                    preferredHeight: 768
                }
                
                ForeignWindowControl {
                    id: fwcCaptionSurface
                    windowId: "myCaptionSurface"
                    
                    updatedProperties: WindowProperty.Size |
                    WindowProperty.Position |
                    WindowProperty.Visible
                    
                    preferredWidth: 1280
                    preferredHeight: 768
                }
                
                
                Button {
                    
                    text: "Play Video"
                    onClicked: {
                        //vidPlayer.setSourceUrl("http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8")
                        if (vidPlayer.play() != MediaError.None) {
                            // Put your error handling code here
                        }
                    }
                }
                
                Button {
                    text: "Stop Video"
                    onClicked: {
                        if (vidPlayer.stop() != MediaError.None) {
                            // Put your error handing code here
                        }
                    }
                }
            }
        }
    }
}

