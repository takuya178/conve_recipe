Unreleased Changes
------------------

1.73.0 (2021-08-24)
------------------

* Feature - AWS Elemental MediaConvert SDK has added MBAFF encoding support for AVC video and the ability to pass encryption context from the job settings to S3.

1.72.0 (2021-08-03)
------------------

* Feature - AWS Elemental MediaConvert SDK has added control over the passthrough of XDS captions metadata to outputs.

1.71.0 (2021-07-30)
------------------

* Feature - Code Generated Changes, see `./build_tools` or `aws-sdk-core`'s CHANGELOG.md for details.

1.70.0 (2021-07-28)
------------------

* Feature - Code Generated Changes, see `./build_tools` or `aws-sdk-core`'s CHANGELOG.md for details.

1.69.0 (2021-07-09)
------------------

* Feature - MediaConvert now supports color, style and position information passthrough from 608 and Teletext to SRT and WebVTT subtitles. MediaConvert now also supports Automatic QVBR quality levels for QVBR RateControlMode.

1.68.0 (2021-06-28)
------------------

* Feature - MediaConvert adds support for HDR10+, ProRes 4444,  and XAVC outputs, ADM/DAMF support for Dolby Atmos ingest, and alternative audio and WebVTT caption ingest via HLS inputs. MediaConvert also now supports creating trickplay outputs for Roku devices for HLS, CMAF, and DASH output groups.

1.67.0 (2021-05-10)
------------------

* Feature - AWS Elemental MediaConvert SDK has added support for Kantar SNAP File Audio Watermarking with a Kantar Watermarking account, and Display Definition Segment(DDS) segment data controls for DVB-Sub caption outputs.

1.66.0 (2021-04-26)
------------------

* Feature - Documentation updates for mediaconvert

1.65.0 (2021-04-01)
------------------

* Feature - MediaConvert now supports HLS ingest, sidecar WebVTT ingest, Teletext color & style passthrough to TTML subtitles, TTML to WebVTT subtitle conversion with style, & DRC profiles in AC3 audio.

1.64.0 (2021-03-10)
------------------

* Feature - Code Generated Changes, see `./build_tools` or `aws-sdk-core`'s CHANGELOG.md for details.

1.63.0 (2021-02-09)
------------------

* Feature - AWS Elemental MediaConvert SDK has added support for WMA audio only ingest, SMPTE-TT text and image caption ingest, and MPEG-2 video in MXF OP1a outputs.

1.62.0 (2021-02-02)
------------------

* Feature - Code Generated Changes, see `./build_tools` or `aws-sdk-core`'s CHANGELOG.md for details.

1.61.0 (2021-01-07)
------------------

* Feature - AWS Elemental MediaConvert SDK has added support for I-Frame-only HLS manifest generation in CMAF outputs.

1.60.0 (2020-11-24)
------------------

* Feature - AWS Elemental MediaConvert SDK has added support for Vorbis and Opus audio in OGG/OGA containers.

1.59.0 (2020-11-11)
------------------

* Feature - AWS Elemental MediaConvert SDK has added support for Automated ABR encoding and improved the reliability of embedded captions in accelerated outputs.

1.58.0 (2020-10-05)
------------------

* Feature - AWS Elemental MediaConvert SDK has added support for AVC-I and VC3 encoding in the MXF OP1a container, Nielsen non-linear watermarking, and InSync FrameFormer frame rate conversion.

1.57.0 (2020-09-30)
------------------

* Feature - Code Generated Changes, see `./build_tools` or `aws-sdk-core`'s CHANGELOG.md for details.

1.56.0 (2020-09-15)
------------------

* Feature - Code Generated Changes, see `./build_tools` or `aws-sdk-core`'s CHANGELOG.md for details.

1.55.0 (2020-08-27)
------------------

* Feature - AWS Elemental MediaConvert SDK has added support for WebM DASH outputs as well as H.264 4:2:2 10-bit output in MOV and MP4.

1.54.0 (2020-08-25)
------------------

* Feature - Code Generated Changes, see `./build_tools` or `aws-sdk-core`'s CHANGELOG.md for details.

1.53.0 (2020-06-23)
------------------

* Feature - Code Generated Changes, see `./build_tools` or `aws-sdk-core`'s CHANGELOG.md for details.

1.52.0 (2020-06-18)
------------------

* Feature - AWS Elemental MediaConvert SDK has added support for NexGuard FileMarker SDK, which allows NexGuard partners to watermark proprietary content in mezzanine and OTT streaming contexts.

1.51.1 (2020-06-11)
------------------

* Issue - Republish previous version with correct dependency on `aws-sdk-core`.

1.51.0 (2020-06-10)
------------------

* Issue - This version has been yanked. (#2327).
* Feature - Code Generated Changes, see `./build_tools` or `aws-sdk-core`'s CHANGELOG.md for details.

1.50.0 (2020-06-03)
------------------

* Feature - AWS Elemental MediaConvert SDK has added support for the encoding of VP8 or VP9 video in WebM container with Vorbis or Opus audio.

1.49.0 (2020-05-28)
------------------

* Feature - Code Generated Changes, see `./build_tools` or `aws-sdk-core`'s CHANGELOG.md for details.

1.48.0 (2020-05-07)
------------------

* Feature - Code Generated Changes, see `./build_tools` or `aws-sdk-core`'s CHANGELOG.md for details.

1.47.0 (2020-04-30)
------------------

* Feature - AWS Elemental MediaConvert SDK has added support for including AFD signaling in MXF wrapper.

1.46.0 (2020-04-16)
------------------

* Feature - AWS Elemental MediaConvert now allows you to specify your input captions frame rate for SCC captions sources.

1.45.0 (2020-04-08)
------------------

* Feature - AWS Elemental MediaConvert SDK adds support for queue hopping. Jobs can now hop from their original queue to a specified alternate queue, based on the maximum wait time that you specify in the job settings.

1.44.0 (2020-03-17)
------------------

* Feature - AWS Elemental MediaConvert SDK has added support for: AV1 encoding in File Group MP4, DASH and CMAF DASH outputs; PCM/WAV audio output in MPEG2-TS containers; and Opus audio in Webm inputs.

1.43.0 (2020-03-09)
------------------

* Feature - Code Generated Changes, see `./build_tools` or `aws-sdk-core`'s CHANGELOG.md for details.

1.42.0 (2020-02-05)
------------------

* Feature - AWS Elemental MediaConvert SDK has added support for fine-tuned QVBR quality level.

1.41.0 (2020-01-17)
------------------

* Feature - AWS Elemental MediaConvert SDK has added support for MP3 audio only outputs.

1.40.0 (2019-11-25)
------------------

* Feature - AWS Elemental MediaConvert SDK has added support for 8K outputs and support for QuickTime Animation Codec (RLE) inputs.

1.39.0 (2019-11-15)
------------------

* Feature - AWS Elemental MediaConvert SDK has added support for DolbyVision encoding, and SCTE35 & ESAM insertion to DASH ISO EMSG.

1.38.0 (2019-10-23)
------------------

* Feature - Code Generated Changes, see `./build_tools` or `aws-sdk-core`'s CHANGELOG.md for details.

1.37.0 (2019-10-09)
------------------

* Feature - AWS Elemental MediaConvert SDK has added support for Dolby Atmos encoding, up to 36 outputs, accelerated transcoding with frame capture and preferred acceleration feature.

1.36.0 (2019-09-16)
------------------

* Feature - AWS Elemental MediaConvert SDK has added support for multi-DRM SPEKE with CMAF outputs, MP3 ingest, and options for improved video quality.

1.35.0 (2019-08-28)
------------------

* Feature - This release adds the ability to send a job to an on-demand queue while simulating the performance of a job sent to a reserved queue. Use this setting to estimate the number of reserved transcoding slots (RTS) you need for a reserved queue.

1.34.0 (2019-08-09)
------------------

* Feature - AWS Elemental MediaConvert has added support for multi-DRM SPEKE with CMAF outputs, MP3 ingest, and options for improved video quality.

1.33.0 (2019-07-30)
------------------

* Feature - MediaConvert adds support for specifying priority (-50 to 50) on jobs submitted to on demand or reserved queues

1.32.0 (2019-07-25)
------------------

* Feature - AWS Elemental MediaConvert has added several features including support for: audio normalization using ITU BS.1770-3, 1770-4 algorithms, extension of job progress indicators, input cropping rectangle & output position rectangle filters per input, and dual SCC caption mapping to additional codecs and containers.

1.31.0 (2019-07-01)
------------------

* Feature - Code Generated Changes, see `./build_tools` or `aws-sdk-core`'s CHANGELOG.md for details.

1.30.0 (2019-06-17)
------------------

* Feature - Code Generated Changes, see `./build_tools` or `aws-sdk-core`'s CHANGELOG.md for details.

1.29.0 (2019-05-21)
------------------

* Feature - API update.

1.28.0 (2019-05-15)
------------------

* Feature - API update.

1.27.0 (2019-05-14)
------------------

* Feature - API update.

1.26.0 (2019-05-03)
------------------

* Feature - API update.

1.25.0 (2019-04-05)
------------------

* Feature - API update.

1.24.0 (2019-03-25)
------------------

* Feature - API update.

1.23.0 (2019-03-21)
------------------

* Feature - API update.

1.22.0 (2019-03-18)
------------------

* Feature - API update.

1.21.0 (2019-03-14)
------------------

* Feature - API update.

1.20.0 (2019-02-26)
------------------

* Feature - API update.

1.19.0 (2019-01-14)
------------------

* Feature - API update.

1.18.0 (2018-11-20)
------------------

* Feature - API update.

1.17.0 (2018-11-19)
------------------

* Feature - API update.

1.16.0 (2018-10-24)
------------------

* Feature - API update.

1.15.0 (2018-10-23)
------------------

* Feature - API update.

1.14.0 (2018-10-11)
------------------

* Feature - API update.

1.13.0 (2018-09-21)
------------------

* Feature - API update.

1.12.0 (2018-09-06)
------------------

* Feature - API update.

1.11.0 (2018-09-06)
------------------

* Feature - Adds code paths and plugins for future SDK instrumentation and telemetry.

1.10.0 (2018-09-05)
------------------

* Feature - API update.

1.9.0 (2018-08-20)
------------------

* Feature - API update.

1.8.0 (2018-08-16)
------------------

* Feature - API update.

1.7.0 (2018-08-10)
------------------

* Feature - API update.

1.6.0 (2018-07-31)
------------------

* Feature - API update.

1.5.0 (2018-07-06)
------------------

* Feature - API update.

1.4.0 (2018-06-26)
------------------

* Feature - API update.

1.3.0 (2018-06-15)
------------------

* Feature - API update.

1.2.0 (2018-06-04)
------------------

* Feature - API update.

1.1.0 (2018-02-15)
------------------

* Feature - API update.

1.0.0 (2017-11-27)
------------------

* Feature - Initial release of `aws-sdk-mediaconvert`.