# Copyright 2015 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'date'
require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module VisionV1p2beta1
      
      # Represents a color in the RGBA color space. This representation is designed
      # for simplicity of conversion to/from color representations in various
      # languages over compactness; for example, the fields of this representation
      # can be trivially provided to the constructor of "java.awt.Color" in Java; it
      # can also be trivially provided to UIColor's "+colorWithRed:green:blue:alpha"
      # method in iOS; and, with just a little work, it can be easily formatted into
      # a CSS "rgba()" string in JavaScript, as well. Here are some examples:
      # Example (Java):
      # import com.google.type.Color;
      # // ...
      # public static java.awt.Color fromProto(Color protocolor) `
      # float alpha = protocolor.hasAlpha()
      # ? protocolor.getAlpha().getValue()
      # : 1.0;
      # return new java.awt.Color(
      # protocolor.getRed(),
      # protocolor.getGreen(),
      # protocolor.getBlue(),
      # alpha);
      # `
      # public static Color toProto(java.awt.Color color) `
      # float red = (float) color.getRed();
      # float green = (float) color.getGreen();
      # float blue = (float) color.getBlue();
      # float denominator = 255.0;
      # Color.Builder resultBuilder =
      # Color
      # .newBuilder()
      # .setRed(red / denominator)
      # .setGreen(green / denominator)
      # .setBlue(blue / denominator);
      # int alpha = color.getAlpha();
      # if (alpha != 255) `
      # result.setAlpha(
      # FloatValue
      # .newBuilder()
      # .setValue(((float) alpha) / denominator)
      # .build());
      # `
      # return resultBuilder.build();
      # `
      # // ...
      # Example (iOS / Obj-C):
      # // ...
      # static UIColor* fromProto(Color* protocolor) `
      # float red = [protocolor red];
      # float green = [protocolor green];
      # float blue = [protocolor blue];
      # FloatValue* alpha_wrapper = [protocolor alpha];
      # float alpha = 1.0;
      # if (alpha_wrapper != nil) `
      # alpha = [alpha_wrapper value];
      # `
      # return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
      # `
      # static Color* toProto(UIColor* color) `
      # CGFloat red, green, blue, alpha;
      # if (![color getRed:&red green:&green blue:&blue alpha:&alpha]) `
      # return nil;
      # `
      # Color* result = [Color alloc] init];
      # [result setRed:red];
      # [result setGreen:green];
      # [result setBlue:blue];
      # if (alpha <= 0.9999) `
      # [result setAlpha:floatWrapperWithValue(alpha)];
      # `
      # [result autorelease];
      # return result;
      # `
      # // ...
      # Example (JavaScript):
      # // ...
      # var protoToCssColor = function(rgb_color) `
      # var redFrac = rgb_color.red || 0.0;
      # var greenFrac = rgb_color.green || 0.0;
      # var blueFrac = rgb_color.blue || 0.0;
      # var red = Math.floor(redFrac * 255);
      # var green = Math.floor(greenFrac * 255);
      # var blue = Math.floor(blueFrac * 255);
      # if (!('alpha' in rgb_color)) `
      # return rgbToCssColor_(red, green, blue);
      # `
      # var alphaFrac = rgb_color.alpha.value || 0.0;
      # var rgbParams = [red, green, blue].join(',');
      # return ['rgba(', rgbParams, ',', alphaFrac, ')'].join('');
      # `;
      # var rgbToCssColor_ = function(red, green, blue) `
      # var rgbNumber = new Number((red << 16) | (green << 8) | blue);
      # var hexString = rgbNumber.toString(16);
      # var missingZeros = 6 - hexString.length;
      # var resultBuilder = ['#'];
      # for (var i = 0; i < missingZeros; i++) `
      # resultBuilder.push('0');
      # `
      # resultBuilder.push(hexString);
      # return resultBuilder.join('');
      # `;
      # // ...
      class Color
        include Google::Apis::Core::Hashable
      
        # The fraction of this color that should be applied to the pixel. That is,
        # the final pixel color is defined by the equation:
        # pixel color = alpha * (this color) + (1.0 - alpha) * (background color)
        # This means that a value of 1.0 corresponds to a solid color, whereas
        # a value of 0.0 corresponds to a completely transparent color. This
        # uses a wrapper message rather than a simple float scalar so that it is
        # possible to distinguish between a default value and the value being unset.
        # If omitted, this color object is to be rendered as a solid color
        # (as if the alpha value had been explicitly given with a value of 1.0).
        # Corresponds to the JSON property `alpha`
        # @return [Float]
        attr_accessor :alpha
      
        # The amount of blue in the color as a value in the interval [0, 1].
        # Corresponds to the JSON property `blue`
        # @return [Float]
        attr_accessor :blue
      
        # The amount of green in the color as a value in the interval [0, 1].
        # Corresponds to the JSON property `green`
        # @return [Float]
        attr_accessor :green
      
        # The amount of red in the color as a value in the interval [0, 1].
        # Corresponds to the JSON property `red`
        # @return [Float]
        attr_accessor :red
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alpha = args[:alpha] if args.key?(:alpha)
          @blue = args[:blue] if args.key?(:blue)
          @green = args[:green] if args.key?(:green)
          @red = args[:red] if args.key?(:red)
        end
      end
      
      # Request for performing Google Cloud Vision API tasks over a user-provided
      # image, with user-requested features.
      class GoogleCloudVisionV1p2beta1AnnotateImageRequest
        include Google::Apis::Core::Hashable
      
        # Requested features.
        # Corresponds to the JSON property `features`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1Feature>]
        attr_accessor :features
      
        # Client image to perform Google Cloud Vision API tasks over.
        # Corresponds to the JSON property `image`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1Image]
        attr_accessor :image
      
        # Image context and/or feature-specific parameters.
        # Corresponds to the JSON property `imageContext`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1ImageContext]
        attr_accessor :image_context
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @features = args[:features] if args.key?(:features)
          @image = args[:image] if args.key?(:image)
          @image_context = args[:image_context] if args.key?(:image_context)
        end
      end
      
      # Response to an image annotation request.
      class GoogleCloudVisionV1p2beta1AnnotateImageResponse
        include Google::Apis::Core::Hashable
      
        # If an image was produced from a file (e.g. a PDF), this message gives
        # information about the source of that image.
        # Corresponds to the JSON property `context`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1ImageAnnotationContext]
        attr_accessor :context
      
        # Set of crop hints that are used to generate new crops when serving images.
        # Corresponds to the JSON property `cropHintsAnnotation`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1CropHintsAnnotation]
        attr_accessor :crop_hints_annotation
      
        # The `Status` type defines a logical error model that is suitable for different
        # programming environments, including REST APIs and RPC APIs. It is used by
        # [gRPC](https://github.com/grpc). The error model is designed to be:
        # - Simple to use and understand for most users
        # - Flexible enough to meet unexpected needs
        # # Overview
        # The `Status` message contains three pieces of data: error code, error message,
        # and error details. The error code should be an enum value of
        # google.rpc.Code, but it may accept additional error codes if needed.  The
        # error message should be a developer-facing English message that helps
        # developers *understand* and *resolve* the error. If a localized user-facing
        # error message is needed, put the localized message in the error details or
        # localize it in the client. The optional error details may contain arbitrary
        # information about the error. There is a predefined set of error detail types
        # in the package `google.rpc` that can be used for common error conditions.
        # # Language mapping
        # The `Status` message is the logical representation of the error model, but it
        # is not necessarily the actual wire format. When the `Status` message is
        # exposed in different client libraries and different wire protocols, it can be
        # mapped differently. For example, it will likely be mapped to some exceptions
        # in Java, but more likely mapped to some error codes in C.
        # # Other uses
        # The error model and the `Status` message can be used in a variety of
        # environments, either with or without APIs, to provide a
        # consistent developer experience across different environments.
        # Example uses of this error model include:
        # - Partial errors. If a service needs to return partial errors to the client,
        # it may embed the `Status` in the normal response to indicate the partial
        # errors.
        # - Workflow errors. A typical workflow has multiple steps. Each step may
        # have a `Status` message for error reporting.
        # - Batch operations. If a client uses batch request and batch response, the
        # `Status` message should be used directly inside batch response, one for
        # each error sub-response.
        # - Asynchronous operations. If an API call embeds asynchronous operation
        # results in its response, the status of those operations should be
        # represented directly using the `Status` message.
        # - Logging. If some API errors are stored in logs, the message `Status` could
        # be used directly after any stripping needed for security/privacy reasons.
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::VisionV1p2beta1::Status]
        attr_accessor :error
      
        # If present, face detection has completed successfully.
        # Corresponds to the JSON property `faceAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1FaceAnnotation>]
        attr_accessor :face_annotations
      
        # TextAnnotation contains a structured representation of OCR extracted text.
        # The hierarchy of an OCR extracted text structure is like this:
        # TextAnnotation -> Page -> Block -> Paragraph -> Word -> Symbol
        # Each structural component, starting from Page, may further have their own
        # properties. Properties describe detected languages, breaks etc.. Please refer
        # to the TextAnnotation.TextProperty message definition below for more
        # detail.
        # Corresponds to the JSON property `fullTextAnnotation`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1TextAnnotation]
        attr_accessor :full_text_annotation
      
        # Stores image properties, such as dominant colors.
        # Corresponds to the JSON property `imagePropertiesAnnotation`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1ImageProperties]
        attr_accessor :image_properties_annotation
      
        # If present, label detection has completed successfully.
        # Corresponds to the JSON property `labelAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1EntityAnnotation>]
        attr_accessor :label_annotations
      
        # If present, landmark detection has completed successfully.
        # Corresponds to the JSON property `landmarkAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1EntityAnnotation>]
        attr_accessor :landmark_annotations
      
        # If present, logo detection has completed successfully.
        # Corresponds to the JSON property `logoAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1EntityAnnotation>]
        attr_accessor :logo_annotations
      
        # Set of features pertaining to the image, computed by computer vision
        # methods over safe-search verticals (for example, adult, spoof, medical,
        # violence).
        # Corresponds to the JSON property `safeSearchAnnotation`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1SafeSearchAnnotation]
        attr_accessor :safe_search_annotation
      
        # If present, text (OCR) detection has completed successfully.
        # Corresponds to the JSON property `textAnnotations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1EntityAnnotation>]
        attr_accessor :text_annotations
      
        # Relevant information for the image from the Internet.
        # Corresponds to the JSON property `webDetection`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1WebDetection]
        attr_accessor :web_detection
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @context = args[:context] if args.key?(:context)
          @crop_hints_annotation = args[:crop_hints_annotation] if args.key?(:crop_hints_annotation)
          @error = args[:error] if args.key?(:error)
          @face_annotations = args[:face_annotations] if args.key?(:face_annotations)
          @full_text_annotation = args[:full_text_annotation] if args.key?(:full_text_annotation)
          @image_properties_annotation = args[:image_properties_annotation] if args.key?(:image_properties_annotation)
          @label_annotations = args[:label_annotations] if args.key?(:label_annotations)
          @landmark_annotations = args[:landmark_annotations] if args.key?(:landmark_annotations)
          @logo_annotations = args[:logo_annotations] if args.key?(:logo_annotations)
          @safe_search_annotation = args[:safe_search_annotation] if args.key?(:safe_search_annotation)
          @text_annotations = args[:text_annotations] if args.key?(:text_annotations)
          @web_detection = args[:web_detection] if args.key?(:web_detection)
        end
      end
      
      # An offline file annotation request.
      class GoogleCloudVisionV1p2beta1AsyncAnnotateFileRequest
        include Google::Apis::Core::Hashable
      
        # Required. Requested features.
        # Corresponds to the JSON property `features`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1Feature>]
        attr_accessor :features
      
        # Image context and/or feature-specific parameters.
        # Corresponds to the JSON property `imageContext`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1ImageContext]
        attr_accessor :image_context
      
        # The desired input location and metadata.
        # Corresponds to the JSON property `inputConfig`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1InputConfig]
        attr_accessor :input_config
      
        # The desired output location and metadata.
        # Corresponds to the JSON property `outputConfig`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1OutputConfig]
        attr_accessor :output_config
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @features = args[:features] if args.key?(:features)
          @image_context = args[:image_context] if args.key?(:image_context)
          @input_config = args[:input_config] if args.key?(:input_config)
          @output_config = args[:output_config] if args.key?(:output_config)
        end
      end
      
      # The response for a single offline file annotation request.
      class GoogleCloudVisionV1p2beta1AsyncAnnotateFileResponse
        include Google::Apis::Core::Hashable
      
        # The desired output location and metadata.
        # Corresponds to the JSON property `outputConfig`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1OutputConfig]
        attr_accessor :output_config
      
        # The full list of output files in GCS.
        # Corresponds to the JSON property `outputs`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1GcsDestination>]
        attr_accessor :outputs
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @output_config = args[:output_config] if args.key?(:output_config)
          @outputs = args[:outputs] if args.key?(:outputs)
        end
      end
      
      # Multiple async file annotation requests are batched into a single service
      # call.
      class GoogleCloudVisionV1p2beta1AsyncBatchAnnotateFilesRequest
        include Google::Apis::Core::Hashable
      
        # Individual async file annotation requests for this batch.
        # Corresponds to the JSON property `requests`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1AsyncAnnotateFileRequest>]
        attr_accessor :requests
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @requests = args[:requests] if args.key?(:requests)
        end
      end
      
      # Response to an async batch file annotation request.
      class GoogleCloudVisionV1p2beta1AsyncBatchAnnotateFilesResponse
        include Google::Apis::Core::Hashable
      
        # The list of file annotation responses, one for each request in
        # AsyncBatchAnnotateFilesRequest.
        # Corresponds to the JSON property `responses`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1AsyncAnnotateFileResponse>]
        attr_accessor :responses
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @responses = args[:responses] if args.key?(:responses)
        end
      end
      
      # Multiple image annotation requests are batched into a single service call.
      class GoogleCloudVisionV1p2beta1BatchAnnotateImagesRequest
        include Google::Apis::Core::Hashable
      
        # Individual image annotation requests for this batch.
        # Corresponds to the JSON property `requests`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1AnnotateImageRequest>]
        attr_accessor :requests
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @requests = args[:requests] if args.key?(:requests)
        end
      end
      
      # Response to a batch image annotation request.
      class GoogleCloudVisionV1p2beta1BatchAnnotateImagesResponse
        include Google::Apis::Core::Hashable
      
        # Individual responses to image annotation requests within the batch.
        # Corresponds to the JSON property `responses`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1AnnotateImageResponse>]
        attr_accessor :responses
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @responses = args[:responses] if args.key?(:responses)
        end
      end
      
      # Logical element on the page.
      class GoogleCloudVisionV1p2beta1Block
        include Google::Apis::Core::Hashable
      
        # Detected block type (text, image etc) for this block.
        # Corresponds to the JSON property `blockType`
        # @return [String]
        attr_accessor :block_type
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingBox`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1BoundingPoly]
        attr_accessor :bounding_box
      
        # Confidence of the OCR results on the block. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # List of paragraphs in this block (if this blocks is of type text).
        # Corresponds to the JSON property `paragraphs`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1Paragraph>]
        attr_accessor :paragraphs
      
        # Additional information detected on the structural component.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1TextAnnotationTextProperty]
        attr_accessor :property
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @block_type = args[:block_type] if args.key?(:block_type)
          @bounding_box = args[:bounding_box] if args.key?(:bounding_box)
          @confidence = args[:confidence] if args.key?(:confidence)
          @paragraphs = args[:paragraphs] if args.key?(:paragraphs)
          @property = args[:property] if args.key?(:property)
        end
      end
      
      # A bounding polygon for the detected image annotation.
      class GoogleCloudVisionV1p2beta1BoundingPoly
        include Google::Apis::Core::Hashable
      
        # The bounding polygon vertices.
        # Corresponds to the JSON property `vertices`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1Vertex>]
        attr_accessor :vertices
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @vertices = args[:vertices] if args.key?(:vertices)
        end
      end
      
      # Color information consists of RGB channels, score, and the fraction of
      # the image that the color occupies in the image.
      class GoogleCloudVisionV1p2beta1ColorInfo
        include Google::Apis::Core::Hashable
      
        # Represents a color in the RGBA color space. This representation is designed
        # for simplicity of conversion to/from color representations in various
        # languages over compactness; for example, the fields of this representation
        # can be trivially provided to the constructor of "java.awt.Color" in Java; it
        # can also be trivially provided to UIColor's "+colorWithRed:green:blue:alpha"
        # method in iOS; and, with just a little work, it can be easily formatted into
        # a CSS "rgba()" string in JavaScript, as well. Here are some examples:
        # Example (Java):
        # import com.google.type.Color;
        # // ...
        # public static java.awt.Color fromProto(Color protocolor) `
        # float alpha = protocolor.hasAlpha()
        # ? protocolor.getAlpha().getValue()
        # : 1.0;
        # return new java.awt.Color(
        # protocolor.getRed(),
        # protocolor.getGreen(),
        # protocolor.getBlue(),
        # alpha);
        # `
        # public static Color toProto(java.awt.Color color) `
        # float red = (float) color.getRed();
        # float green = (float) color.getGreen();
        # float blue = (float) color.getBlue();
        # float denominator = 255.0;
        # Color.Builder resultBuilder =
        # Color
        # .newBuilder()
        # .setRed(red / denominator)
        # .setGreen(green / denominator)
        # .setBlue(blue / denominator);
        # int alpha = color.getAlpha();
        # if (alpha != 255) `
        # result.setAlpha(
        # FloatValue
        # .newBuilder()
        # .setValue(((float) alpha) / denominator)
        # .build());
        # `
        # return resultBuilder.build();
        # `
        # // ...
        # Example (iOS / Obj-C):
        # // ...
        # static UIColor* fromProto(Color* protocolor) `
        # float red = [protocolor red];
        # float green = [protocolor green];
        # float blue = [protocolor blue];
        # FloatValue* alpha_wrapper = [protocolor alpha];
        # float alpha = 1.0;
        # if (alpha_wrapper != nil) `
        # alpha = [alpha_wrapper value];
        # `
        # return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
        # `
        # static Color* toProto(UIColor* color) `
        # CGFloat red, green, blue, alpha;
        # if (![color getRed:&red green:&green blue:&blue alpha:&alpha]) `
        # return nil;
        # `
        # Color* result = [Color alloc] init];
        # [result setRed:red];
        # [result setGreen:green];
        # [result setBlue:blue];
        # if (alpha <= 0.9999) `
        # [result setAlpha:floatWrapperWithValue(alpha)];
        # `
        # [result autorelease];
        # return result;
        # `
        # // ...
        # Example (JavaScript):
        # // ...
        # var protoToCssColor = function(rgb_color) `
        # var redFrac = rgb_color.red || 0.0;
        # var greenFrac = rgb_color.green || 0.0;
        # var blueFrac = rgb_color.blue || 0.0;
        # var red = Math.floor(redFrac * 255);
        # var green = Math.floor(greenFrac * 255);
        # var blue = Math.floor(blueFrac * 255);
        # if (!('alpha' in rgb_color)) `
        # return rgbToCssColor_(red, green, blue);
        # `
        # var alphaFrac = rgb_color.alpha.value || 0.0;
        # var rgbParams = [red, green, blue].join(',');
        # return ['rgba(', rgbParams, ',', alphaFrac, ')'].join('');
        # `;
        # var rgbToCssColor_ = function(red, green, blue) `
        # var rgbNumber = new Number((red << 16) | (green << 8) | blue);
        # var hexString = rgbNumber.toString(16);
        # var missingZeros = 6 - hexString.length;
        # var resultBuilder = ['#'];
        # for (var i = 0; i < missingZeros; i++) `
        # resultBuilder.push('0');
        # `
        # resultBuilder.push(hexString);
        # return resultBuilder.join('');
        # `;
        # // ...
        # Corresponds to the JSON property `color`
        # @return [Google::Apis::VisionV1p2beta1::Color]
        attr_accessor :color
      
        # The fraction of pixels the color occupies in the image.
        # Value in range [0, 1].
        # Corresponds to the JSON property `pixelFraction`
        # @return [Float]
        attr_accessor :pixel_fraction
      
        # Image-specific score for this color. Value in range [0, 1].
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @color = args[:color] if args.key?(:color)
          @pixel_fraction = args[:pixel_fraction] if args.key?(:pixel_fraction)
          @score = args[:score] if args.key?(:score)
        end
      end
      
      # Single crop hint that is used to generate a new crop when serving an image.
      class GoogleCloudVisionV1p2beta1CropHint
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1BoundingPoly]
        attr_accessor :bounding_poly
      
        # Confidence of this being a salient region.  Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Fraction of importance of this salient region with respect to the original
        # image.
        # Corresponds to the JSON property `importanceFraction`
        # @return [Float]
        attr_accessor :importance_fraction
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_poly = args[:bounding_poly] if args.key?(:bounding_poly)
          @confidence = args[:confidence] if args.key?(:confidence)
          @importance_fraction = args[:importance_fraction] if args.key?(:importance_fraction)
        end
      end
      
      # Set of crop hints that are used to generate new crops when serving images.
      class GoogleCloudVisionV1p2beta1CropHintsAnnotation
        include Google::Apis::Core::Hashable
      
        # Crop hint results.
        # Corresponds to the JSON property `cropHints`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1CropHint>]
        attr_accessor :crop_hints
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @crop_hints = args[:crop_hints] if args.key?(:crop_hints)
        end
      end
      
      # Parameters for crop hints annotation request.
      class GoogleCloudVisionV1p2beta1CropHintsParams
        include Google::Apis::Core::Hashable
      
        # Aspect ratios in floats, representing the ratio of the width to the height
        # of the image. For example, if the desired aspect ratio is 4/3, the
        # corresponding float value should be 1.33333.  If not specified, the
        # best possible crop is returned. The number of provided aspect ratios is
        # limited to a maximum of 16; any aspect ratios provided after the 16th are
        # ignored.
        # Corresponds to the JSON property `aspectRatios`
        # @return [Array<Float>]
        attr_accessor :aspect_ratios
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @aspect_ratios = args[:aspect_ratios] if args.key?(:aspect_ratios)
        end
      end
      
      # Set of dominant colors and their corresponding scores.
      class GoogleCloudVisionV1p2beta1DominantColorsAnnotation
        include Google::Apis::Core::Hashable
      
        # RGB color values with their score and pixel fraction.
        # Corresponds to the JSON property `colors`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1ColorInfo>]
        attr_accessor :colors
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @colors = args[:colors] if args.key?(:colors)
        end
      end
      
      # Set of detected entity features.
      class GoogleCloudVisionV1p2beta1EntityAnnotation
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1BoundingPoly]
        attr_accessor :bounding_poly
      
        # **Deprecated. Use `score` instead.**
        # The accuracy of the entity detection in an image.
        # For example, for an image in which the "Eiffel Tower" entity is detected,
        # this field represents the confidence that there is a tower in the query
        # image. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Entity textual description, expressed in its `locale` language.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # The language code for the locale in which the entity textual
        # `description` is expressed.
        # Corresponds to the JSON property `locale`
        # @return [String]
        attr_accessor :locale
      
        # The location information for the detected entity. Multiple
        # `LocationInfo` elements can be present because one location may
        # indicate the location of the scene in the image, and another location
        # may indicate the location of the place where the image was taken.
        # Location information is usually present for landmarks.
        # Corresponds to the JSON property `locations`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1LocationInfo>]
        attr_accessor :locations
      
        # Opaque entity ID. Some IDs may be available in
        # [Google Knowledge Graph Search
        # API](https://developers.google.com/knowledge-graph/).
        # Corresponds to the JSON property `mid`
        # @return [String]
        attr_accessor :mid
      
        # Some entities may have optional user-supplied `Property` (name/value)
        # fields, such a score or string that qualifies the entity.
        # Corresponds to the JSON property `properties`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1Property>]
        attr_accessor :properties
      
        # Overall score of the result. Range [0, 1].
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        # The relevancy of the ICA (Image Content Annotation) label to the
        # image. For example, the relevancy of "tower" is likely higher to an image
        # containing the detected "Eiffel Tower" than to an image containing a
        # detected distant towering building, even though the confidence that
        # there is a tower in each image may be the same. Range [0, 1].
        # Corresponds to the JSON property `topicality`
        # @return [Float]
        attr_accessor :topicality
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_poly = args[:bounding_poly] if args.key?(:bounding_poly)
          @confidence = args[:confidence] if args.key?(:confidence)
          @description = args[:description] if args.key?(:description)
          @locale = args[:locale] if args.key?(:locale)
          @locations = args[:locations] if args.key?(:locations)
          @mid = args[:mid] if args.key?(:mid)
          @properties = args[:properties] if args.key?(:properties)
          @score = args[:score] if args.key?(:score)
          @topicality = args[:topicality] if args.key?(:topicality)
        end
      end
      
      # A face annotation object contains the results of face detection.
      class GoogleCloudVisionV1p2beta1FaceAnnotation
        include Google::Apis::Core::Hashable
      
        # Anger likelihood.
        # Corresponds to the JSON property `angerLikelihood`
        # @return [String]
        attr_accessor :anger_likelihood
      
        # Blurred likelihood.
        # Corresponds to the JSON property `blurredLikelihood`
        # @return [String]
        attr_accessor :blurred_likelihood
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1BoundingPoly]
        attr_accessor :bounding_poly
      
        # Detection confidence. Range [0, 1].
        # Corresponds to the JSON property `detectionConfidence`
        # @return [Float]
        attr_accessor :detection_confidence
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `fdBoundingPoly`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1BoundingPoly]
        attr_accessor :fd_bounding_poly
      
        # Headwear likelihood.
        # Corresponds to the JSON property `headwearLikelihood`
        # @return [String]
        attr_accessor :headwear_likelihood
      
        # Joy likelihood.
        # Corresponds to the JSON property `joyLikelihood`
        # @return [String]
        attr_accessor :joy_likelihood
      
        # Face landmarking confidence. Range [0, 1].
        # Corresponds to the JSON property `landmarkingConfidence`
        # @return [Float]
        attr_accessor :landmarking_confidence
      
        # Detected face landmarks.
        # Corresponds to the JSON property `landmarks`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1FaceAnnotationLandmark>]
        attr_accessor :landmarks
      
        # Yaw angle, which indicates the leftward/rightward angle that the face is
        # pointing relative to the vertical plane perpendicular to the image. Range
        # [-180,180].
        # Corresponds to the JSON property `panAngle`
        # @return [Float]
        attr_accessor :pan_angle
      
        # Roll angle, which indicates the amount of clockwise/anti-clockwise rotation
        # of the face relative to the image vertical about the axis perpendicular to
        # the face. Range [-180,180].
        # Corresponds to the JSON property `rollAngle`
        # @return [Float]
        attr_accessor :roll_angle
      
        # Sorrow likelihood.
        # Corresponds to the JSON property `sorrowLikelihood`
        # @return [String]
        attr_accessor :sorrow_likelihood
      
        # Surprise likelihood.
        # Corresponds to the JSON property `surpriseLikelihood`
        # @return [String]
        attr_accessor :surprise_likelihood
      
        # Pitch angle, which indicates the upwards/downwards angle that the face is
        # pointing relative to the image's horizontal plane. Range [-180,180].
        # Corresponds to the JSON property `tiltAngle`
        # @return [Float]
        attr_accessor :tilt_angle
      
        # Under-exposed likelihood.
        # Corresponds to the JSON property `underExposedLikelihood`
        # @return [String]
        attr_accessor :under_exposed_likelihood
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @anger_likelihood = args[:anger_likelihood] if args.key?(:anger_likelihood)
          @blurred_likelihood = args[:blurred_likelihood] if args.key?(:blurred_likelihood)
          @bounding_poly = args[:bounding_poly] if args.key?(:bounding_poly)
          @detection_confidence = args[:detection_confidence] if args.key?(:detection_confidence)
          @fd_bounding_poly = args[:fd_bounding_poly] if args.key?(:fd_bounding_poly)
          @headwear_likelihood = args[:headwear_likelihood] if args.key?(:headwear_likelihood)
          @joy_likelihood = args[:joy_likelihood] if args.key?(:joy_likelihood)
          @landmarking_confidence = args[:landmarking_confidence] if args.key?(:landmarking_confidence)
          @landmarks = args[:landmarks] if args.key?(:landmarks)
          @pan_angle = args[:pan_angle] if args.key?(:pan_angle)
          @roll_angle = args[:roll_angle] if args.key?(:roll_angle)
          @sorrow_likelihood = args[:sorrow_likelihood] if args.key?(:sorrow_likelihood)
          @surprise_likelihood = args[:surprise_likelihood] if args.key?(:surprise_likelihood)
          @tilt_angle = args[:tilt_angle] if args.key?(:tilt_angle)
          @under_exposed_likelihood = args[:under_exposed_likelihood] if args.key?(:under_exposed_likelihood)
        end
      end
      
      # A face-specific landmark (for example, a face feature).
      class GoogleCloudVisionV1p2beta1FaceAnnotationLandmark
        include Google::Apis::Core::Hashable
      
        # A 3D position in the image, used primarily for Face detection landmarks.
        # A valid Position must have both x and y coordinates.
        # The position coordinates are in the same scale as the original image.
        # Corresponds to the JSON property `position`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1Position]
        attr_accessor :position
      
        # Face landmark type.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @position = args[:position] if args.key?(:position)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # The type of Google Cloud Vision API detection to perform, and the maximum
      # number of results to return for that type. Multiple `Feature` objects can
      # be specified in the `features` list.
      class GoogleCloudVisionV1p2beta1Feature
        include Google::Apis::Core::Hashable
      
        # Maximum number of results of this type. Does not apply to
        # `TEXT_DETECTION`, `DOCUMENT_TEXT_DETECTION`, or `CROP_HINTS`.
        # Corresponds to the JSON property `maxResults`
        # @return [Fixnum]
        attr_accessor :max_results
      
        # Model to use for the feature.
        # Supported values: "builtin/stable" (the default if unset) and
        # "builtin/latest".
        # Corresponds to the JSON property `model`
        # @return [String]
        attr_accessor :model
      
        # The feature type.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @max_results = args[:max_results] if args.key?(:max_results)
          @model = args[:model] if args.key?(:model)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # The Google Cloud Storage location where the output will be written to.
      class GoogleCloudVisionV1p2beta1GcsDestination
        include Google::Apis::Core::Hashable
      
        # Google Cloud Storage URI where the results will be stored. Results will
        # be in JSON format and preceded by its corresponding input URI. This field
        # can either represent a single file, or a prefix for multiple outputs.
        # Prefixes must end in a `/`.
        # Examples:
        # *    File: gs://bucket-name/filename.json
        # *    Prefix: gs://bucket-name/prefix/here/
        # *    File: gs://bucket-name/prefix/here
        # If multiple outputs, each response is still AnnotateFileResponse, each of
        # which contains some subset of the full list of AnnotateImageResponse.
        # Multiple outputs can happen if, for example, the output JSON is too large
        # and overflows into multiple sharded files.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # The Google Cloud Storage location where the input will be read from.
      class GoogleCloudVisionV1p2beta1GcsSource
        include Google::Apis::Core::Hashable
      
        # Google Cloud Storage URI for the input file. This must only be a GCS
        # object. Wildcards are not currently supported.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Client image to perform Google Cloud Vision API tasks over.
      class GoogleCloudVisionV1p2beta1Image
        include Google::Apis::Core::Hashable
      
        # Image content, represented as a stream of bytes.
        # Note: As with all `bytes` fields, protobuffers use a pure binary
        # representation, whereas JSON representations use base64.
        # Corresponds to the JSON property `content`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :content
      
        # External image source (Google Cloud Storage or web URL image location).
        # Corresponds to the JSON property `source`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1ImageSource]
        attr_accessor :source
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @source = args[:source] if args.key?(:source)
        end
      end
      
      # If an image was produced from a file (e.g. a PDF), this message gives
      # information about the source of that image.
      class GoogleCloudVisionV1p2beta1ImageAnnotationContext
        include Google::Apis::Core::Hashable
      
        # If the file was a PDF or TIFF, this field gives the page number within
        # the file used to produce the image.
        # Corresponds to the JSON property `pageNumber`
        # @return [Fixnum]
        attr_accessor :page_number
      
        # The URI of the file used to produce the image.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @page_number = args[:page_number] if args.key?(:page_number)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Image context and/or feature-specific parameters.
      class GoogleCloudVisionV1p2beta1ImageContext
        include Google::Apis::Core::Hashable
      
        # Parameters for crop hints annotation request.
        # Corresponds to the JSON property `cropHintsParams`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1CropHintsParams]
        attr_accessor :crop_hints_params
      
        # List of languages to use for TEXT_DETECTION. In most cases, an empty value
        # yields the best results since it enables automatic language detection. For
        # languages based on the Latin alphabet, setting `language_hints` is not
        # needed. In rare cases, when the language of the text in the image is known,
        # setting a hint will help get better results (although it will be a
        # significant hindrance if the hint is wrong). Text detection returns an
        # error if one or more of the specified languages is not one of the
        # [supported languages](/vision/docs/languages).
        # Corresponds to the JSON property `languageHints`
        # @return [Array<String>]
        attr_accessor :language_hints
      
        # Rectangle determined by min and max `LatLng` pairs.
        # Corresponds to the JSON property `latLongRect`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1LatLongRect]
        attr_accessor :lat_long_rect
      
        # Parameters for web detection request.
        # Corresponds to the JSON property `webDetectionParams`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1WebDetectionParams]
        attr_accessor :web_detection_params
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @crop_hints_params = args[:crop_hints_params] if args.key?(:crop_hints_params)
          @language_hints = args[:language_hints] if args.key?(:language_hints)
          @lat_long_rect = args[:lat_long_rect] if args.key?(:lat_long_rect)
          @web_detection_params = args[:web_detection_params] if args.key?(:web_detection_params)
        end
      end
      
      # Stores image properties, such as dominant colors.
      class GoogleCloudVisionV1p2beta1ImageProperties
        include Google::Apis::Core::Hashable
      
        # Set of dominant colors and their corresponding scores.
        # Corresponds to the JSON property `dominantColors`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1DominantColorsAnnotation]
        attr_accessor :dominant_colors
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @dominant_colors = args[:dominant_colors] if args.key?(:dominant_colors)
        end
      end
      
      # External image source (Google Cloud Storage or web URL image location).
      class GoogleCloudVisionV1p2beta1ImageSource
        include Google::Apis::Core::Hashable
      
        # **Use `image_uri` instead.**
        # The Google Cloud Storage  URI of the form
        # `gs://bucket_name/object_name`. Object versioning is not supported. See
        # [Google Cloud Storage Request
        # URIs](https://cloud.google.com/storage/docs/reference-uris) for more info.
        # Corresponds to the JSON property `gcsImageUri`
        # @return [String]
        attr_accessor :gcs_image_uri
      
        # The URI of the source image. Can be either:
        # 1. A Google Cloud Storage URI of the form
        # `gs://bucket_name/object_name`. Object versioning is not supported. See
        # [Google Cloud Storage Request
        # URIs](https://cloud.google.com/storage/docs/reference-uris) for more
        # info.
        # 2. A publicly-accessible image HTTP/HTTPS URL. When fetching images from
        # HTTP/HTTPS URLs, Google cannot guarantee that the request will be
        # completed. Your request may fail if the specified host denies the
        # request (e.g. due to request throttling or DOS prevention), or if Google
        # throttles requests to the site for abuse prevention. You should not
        # depend on externally-hosted images for production applications.
        # When both `gcs_image_uri` and `image_uri` are specified, `image_uri` takes
        # precedence.
        # Corresponds to the JSON property `imageUri`
        # @return [String]
        attr_accessor :image_uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @gcs_image_uri = args[:gcs_image_uri] if args.key?(:gcs_image_uri)
          @image_uri = args[:image_uri] if args.key?(:image_uri)
        end
      end
      
      # The desired input location and metadata.
      class GoogleCloudVisionV1p2beta1InputConfig
        include Google::Apis::Core::Hashable
      
        # The Google Cloud Storage location where the input will be read from.
        # Corresponds to the JSON property `gcsSource`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1GcsSource]
        attr_accessor :gcs_source
      
        # The type of the file. Currently only "application/pdf" and "image/tiff"
        # are supported. Wildcards are not supported.
        # Corresponds to the JSON property `mimeType`
        # @return [String]
        attr_accessor :mime_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @gcs_source = args[:gcs_source] if args.key?(:gcs_source)
          @mime_type = args[:mime_type] if args.key?(:mime_type)
        end
      end
      
      # Rectangle determined by min and max `LatLng` pairs.
      class GoogleCloudVisionV1p2beta1LatLongRect
        include Google::Apis::Core::Hashable
      
        # An object representing a latitude/longitude pair. This is expressed as a pair
        # of doubles representing degrees latitude and degrees longitude. Unless
        # specified otherwise, this must conform to the
        # <a href="http://www.unoosa.org/pdf/icg/2012/template/WGS_84.pdf">WGS84
        # standard</a>. Values must be within normalized ranges.
        # Corresponds to the JSON property `maxLatLng`
        # @return [Google::Apis::VisionV1p2beta1::LatLng]
        attr_accessor :max_lat_lng
      
        # An object representing a latitude/longitude pair. This is expressed as a pair
        # of doubles representing degrees latitude and degrees longitude. Unless
        # specified otherwise, this must conform to the
        # <a href="http://www.unoosa.org/pdf/icg/2012/template/WGS_84.pdf">WGS84
        # standard</a>. Values must be within normalized ranges.
        # Corresponds to the JSON property `minLatLng`
        # @return [Google::Apis::VisionV1p2beta1::LatLng]
        attr_accessor :min_lat_lng
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @max_lat_lng = args[:max_lat_lng] if args.key?(:max_lat_lng)
          @min_lat_lng = args[:min_lat_lng] if args.key?(:min_lat_lng)
        end
      end
      
      # Detected entity location information.
      class GoogleCloudVisionV1p2beta1LocationInfo
        include Google::Apis::Core::Hashable
      
        # An object representing a latitude/longitude pair. This is expressed as a pair
        # of doubles representing degrees latitude and degrees longitude. Unless
        # specified otherwise, this must conform to the
        # <a href="http://www.unoosa.org/pdf/icg/2012/template/WGS_84.pdf">WGS84
        # standard</a>. Values must be within normalized ranges.
        # Corresponds to the JSON property `latLng`
        # @return [Google::Apis::VisionV1p2beta1::LatLng]
        attr_accessor :lat_lng
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @lat_lng = args[:lat_lng] if args.key?(:lat_lng)
        end
      end
      
      # Contains metadata for the BatchAnnotateImages operation.
      class GoogleCloudVisionV1p2beta1OperationMetadata
        include Google::Apis::Core::Hashable
      
        # The time when the batch request was received.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Current state of the batch operation.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # The time when the operation result was last updated.
        # Corresponds to the JSON property `updateTime`
        # @return [String]
        attr_accessor :update_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @state = args[:state] if args.key?(:state)
          @update_time = args[:update_time] if args.key?(:update_time)
        end
      end
      
      # The desired output location and metadata.
      class GoogleCloudVisionV1p2beta1OutputConfig
        include Google::Apis::Core::Hashable
      
        # The max number of response protos to put into each output JSON file on GCS.
        # The valid range is [1, 100]. If not specified, the default value is 20.
        # For example, for one pdf file with 100 pages, 100 response protos will
        # be generated. If `batch_size` = 20, then 5 json files each
        # containing 20 response protos will be written under the prefix
        # `gcs_destination`.`uri`.
        # Currently, batch_size only applies to GcsDestination, with potential future
        # support for other output configurations.
        # Corresponds to the JSON property `batchSize`
        # @return [Fixnum]
        attr_accessor :batch_size
      
        # The Google Cloud Storage location where the output will be written to.
        # Corresponds to the JSON property `gcsDestination`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1GcsDestination]
        attr_accessor :gcs_destination
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @batch_size = args[:batch_size] if args.key?(:batch_size)
          @gcs_destination = args[:gcs_destination] if args.key?(:gcs_destination)
        end
      end
      
      # Detected page from OCR.
      class GoogleCloudVisionV1p2beta1Page
        include Google::Apis::Core::Hashable
      
        # List of blocks of text, images etc on this page.
        # Corresponds to the JSON property `blocks`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1Block>]
        attr_accessor :blocks
      
        # Confidence of the OCR results on the page. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Page height. For PDFs the unit is points. For images (including
        # TIFFs) the unit is pixels.
        # Corresponds to the JSON property `height`
        # @return [Fixnum]
        attr_accessor :height
      
        # Additional information detected on the structural component.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1TextAnnotationTextProperty]
        attr_accessor :property
      
        # Page width. For PDFs the unit is points. For images (including
        # TIFFs) the unit is pixels.
        # Corresponds to the JSON property `width`
        # @return [Fixnum]
        attr_accessor :width
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @blocks = args[:blocks] if args.key?(:blocks)
          @confidence = args[:confidence] if args.key?(:confidence)
          @height = args[:height] if args.key?(:height)
          @property = args[:property] if args.key?(:property)
          @width = args[:width] if args.key?(:width)
        end
      end
      
      # Structural unit of text representing a number of words in certain order.
      class GoogleCloudVisionV1p2beta1Paragraph
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingBox`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1BoundingPoly]
        attr_accessor :bounding_box
      
        # Confidence of the OCR results for the paragraph. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Additional information detected on the structural component.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1TextAnnotationTextProperty]
        attr_accessor :property
      
        # List of words in this paragraph.
        # Corresponds to the JSON property `words`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1Word>]
        attr_accessor :words
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_box = args[:bounding_box] if args.key?(:bounding_box)
          @confidence = args[:confidence] if args.key?(:confidence)
          @property = args[:property] if args.key?(:property)
          @words = args[:words] if args.key?(:words)
        end
      end
      
      # A 3D position in the image, used primarily for Face detection landmarks.
      # A valid Position must have both x and y coordinates.
      # The position coordinates are in the same scale as the original image.
      class GoogleCloudVisionV1p2beta1Position
        include Google::Apis::Core::Hashable
      
        # X coordinate.
        # Corresponds to the JSON property `x`
        # @return [Float]
        attr_accessor :x
      
        # Y coordinate.
        # Corresponds to the JSON property `y`
        # @return [Float]
        attr_accessor :y
      
        # Z coordinate (or depth).
        # Corresponds to the JSON property `z`
        # @return [Float]
        attr_accessor :z
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @x = args[:x] if args.key?(:x)
          @y = args[:y] if args.key?(:y)
          @z = args[:z] if args.key?(:z)
        end
      end
      
      # A `Property` consists of a user-supplied name/value pair.
      class GoogleCloudVisionV1p2beta1Property
        include Google::Apis::Core::Hashable
      
        # Name of the property.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Value of numeric properties.
        # Corresponds to the JSON property `uint64Value`
        # @return [Fixnum]
        attr_accessor :uint64_value
      
        # Value of the property.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @name = args[:name] if args.key?(:name)
          @uint64_value = args[:uint64_value] if args.key?(:uint64_value)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Set of features pertaining to the image, computed by computer vision
      # methods over safe-search verticals (for example, adult, spoof, medical,
      # violence).
      class GoogleCloudVisionV1p2beta1SafeSearchAnnotation
        include Google::Apis::Core::Hashable
      
        # Represents the adult content likelihood for the image. Adult content may
        # contain elements such as nudity, pornographic images or cartoons, or
        # sexual activities.
        # Corresponds to the JSON property `adult`
        # @return [String]
        attr_accessor :adult
      
        # Likelihood that this is a medical image.
        # Corresponds to the JSON property `medical`
        # @return [String]
        attr_accessor :medical
      
        # Likelihood that the request image contains racy content. Racy content may
        # include (but is not limited to) skimpy or sheer clothing, strategically
        # covered nudity, lewd or provocative poses, or close-ups of sensitive
        # body areas.
        # Corresponds to the JSON property `racy`
        # @return [String]
        attr_accessor :racy
      
        # Spoof likelihood. The likelihood that an modification
        # was made to the image's canonical version to make it appear
        # funny or offensive.
        # Corresponds to the JSON property `spoof`
        # @return [String]
        attr_accessor :spoof
      
        # Likelihood that this image contains violent content.
        # Corresponds to the JSON property `violence`
        # @return [String]
        attr_accessor :violence
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @adult = args[:adult] if args.key?(:adult)
          @medical = args[:medical] if args.key?(:medical)
          @racy = args[:racy] if args.key?(:racy)
          @spoof = args[:spoof] if args.key?(:spoof)
          @violence = args[:violence] if args.key?(:violence)
        end
      end
      
      # A single symbol representation.
      class GoogleCloudVisionV1p2beta1Symbol
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingBox`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1BoundingPoly]
        attr_accessor :bounding_box
      
        # Confidence of the OCR results for the symbol. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Additional information detected on the structural component.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1TextAnnotationTextProperty]
        attr_accessor :property
      
        # The actual UTF-8 representation of the symbol.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_box = args[:bounding_box] if args.key?(:bounding_box)
          @confidence = args[:confidence] if args.key?(:confidence)
          @property = args[:property] if args.key?(:property)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # TextAnnotation contains a structured representation of OCR extracted text.
      # The hierarchy of an OCR extracted text structure is like this:
      # TextAnnotation -> Page -> Block -> Paragraph -> Word -> Symbol
      # Each structural component, starting from Page, may further have their own
      # properties. Properties describe detected languages, breaks etc.. Please refer
      # to the TextAnnotation.TextProperty message definition below for more
      # detail.
      class GoogleCloudVisionV1p2beta1TextAnnotation
        include Google::Apis::Core::Hashable
      
        # List of pages detected by OCR.
        # Corresponds to the JSON property `pages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1Page>]
        attr_accessor :pages
      
        # UTF-8 text detected on the pages.
        # Corresponds to the JSON property `text`
        # @return [String]
        attr_accessor :text
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @pages = args[:pages] if args.key?(:pages)
          @text = args[:text] if args.key?(:text)
        end
      end
      
      # Detected start or end of a structural component.
      class GoogleCloudVisionV1p2beta1TextAnnotationDetectedBreak
        include Google::Apis::Core::Hashable
      
        # True if break prepends the element.
        # Corresponds to the JSON property `isPrefix`
        # @return [Boolean]
        attr_accessor :is_prefix
        alias_method :is_prefix?, :is_prefix
      
        # Detected break type.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @is_prefix = args[:is_prefix] if args.key?(:is_prefix)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Detected language for a structural component.
      class GoogleCloudVisionV1p2beta1TextAnnotationDetectedLanguage
        include Google::Apis::Core::Hashable
      
        # Confidence of detected language. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # The BCP-47 language code, such as "en-US" or "sr-Latn". For more
        # information, see
        # http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @confidence = args[:confidence] if args.key?(:confidence)
          @language_code = args[:language_code] if args.key?(:language_code)
        end
      end
      
      # Additional information detected on the structural component.
      class GoogleCloudVisionV1p2beta1TextAnnotationTextProperty
        include Google::Apis::Core::Hashable
      
        # Detected start or end of a structural component.
        # Corresponds to the JSON property `detectedBreak`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1TextAnnotationDetectedBreak]
        attr_accessor :detected_break
      
        # A list of detected languages together with confidence.
        # Corresponds to the JSON property `detectedLanguages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1TextAnnotationDetectedLanguage>]
        attr_accessor :detected_languages
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @detected_break = args[:detected_break] if args.key?(:detected_break)
          @detected_languages = args[:detected_languages] if args.key?(:detected_languages)
        end
      end
      
      # A vertex represents a 2D point in the image.
      # NOTE: the vertex coordinates are in the same scale as the original image.
      class GoogleCloudVisionV1p2beta1Vertex
        include Google::Apis::Core::Hashable
      
        # X coordinate.
        # Corresponds to the JSON property `x`
        # @return [Fixnum]
        attr_accessor :x
      
        # Y coordinate.
        # Corresponds to the JSON property `y`
        # @return [Fixnum]
        attr_accessor :y
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @x = args[:x] if args.key?(:x)
          @y = args[:y] if args.key?(:y)
        end
      end
      
      # Relevant information for the image from the Internet.
      class GoogleCloudVisionV1p2beta1WebDetection
        include Google::Apis::Core::Hashable
      
        # Best guess text labels for the request image.
        # Corresponds to the JSON property `bestGuessLabels`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1WebDetectionWebLabel>]
        attr_accessor :best_guess_labels
      
        # Fully matching images from the Internet.
        # Can include resized copies of the query image.
        # Corresponds to the JSON property `fullMatchingImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1WebDetectionWebImage>]
        attr_accessor :full_matching_images
      
        # Web pages containing the matching images from the Internet.
        # Corresponds to the JSON property `pagesWithMatchingImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1WebDetectionWebPage>]
        attr_accessor :pages_with_matching_images
      
        # Partial matching images from the Internet.
        # Those images are similar enough to share some key-point features. For
        # example an original image will likely have partial matching for its crops.
        # Corresponds to the JSON property `partialMatchingImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1WebDetectionWebImage>]
        attr_accessor :partial_matching_images
      
        # The visually similar image results.
        # Corresponds to the JSON property `visuallySimilarImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1WebDetectionWebImage>]
        attr_accessor :visually_similar_images
      
        # Deduced entities from similar images on the Internet.
        # Corresponds to the JSON property `webEntities`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1WebDetectionWebEntity>]
        attr_accessor :web_entities
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @best_guess_labels = args[:best_guess_labels] if args.key?(:best_guess_labels)
          @full_matching_images = args[:full_matching_images] if args.key?(:full_matching_images)
          @pages_with_matching_images = args[:pages_with_matching_images] if args.key?(:pages_with_matching_images)
          @partial_matching_images = args[:partial_matching_images] if args.key?(:partial_matching_images)
          @visually_similar_images = args[:visually_similar_images] if args.key?(:visually_similar_images)
          @web_entities = args[:web_entities] if args.key?(:web_entities)
        end
      end
      
      # Parameters for web detection request.
      class GoogleCloudVisionV1p2beta1WebDetectionParams
        include Google::Apis::Core::Hashable
      
        # Whether to include results derived from the geo information in the image.
        # Corresponds to the JSON property `includeGeoResults`
        # @return [Boolean]
        attr_accessor :include_geo_results
        alias_method :include_geo_results?, :include_geo_results
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @include_geo_results = args[:include_geo_results] if args.key?(:include_geo_results)
        end
      end
      
      # Entity deduced from similar images on the Internet.
      class GoogleCloudVisionV1p2beta1WebDetectionWebEntity
        include Google::Apis::Core::Hashable
      
        # Canonical description of the entity, in English.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Opaque entity ID.
        # Corresponds to the JSON property `entityId`
        # @return [String]
        attr_accessor :entity_id
      
        # Overall relevancy score for the entity.
        # Not normalized and not comparable across different image queries.
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @entity_id = args[:entity_id] if args.key?(:entity_id)
          @score = args[:score] if args.key?(:score)
        end
      end
      
      # Metadata for online images.
      class GoogleCloudVisionV1p2beta1WebDetectionWebImage
        include Google::Apis::Core::Hashable
      
        # (Deprecated) Overall relevancy score for the image.
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        # The result image URL.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @score = args[:score] if args.key?(:score)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # Label to provide extra metadata for the web detection.
      class GoogleCloudVisionV1p2beta1WebDetectionWebLabel
        include Google::Apis::Core::Hashable
      
        # Label for extra metadata.
        # Corresponds to the JSON property `label`
        # @return [String]
        attr_accessor :label
      
        # The BCP-47 language code for `label`, such as "en-US" or "sr-Latn".
        # For more information, see
        # http://www.unicode.org/reports/tr35/#Unicode_locale_identifier.
        # Corresponds to the JSON property `languageCode`
        # @return [String]
        attr_accessor :language_code
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @label = args[:label] if args.key?(:label)
          @language_code = args[:language_code] if args.key?(:language_code)
        end
      end
      
      # Metadata for web pages.
      class GoogleCloudVisionV1p2beta1WebDetectionWebPage
        include Google::Apis::Core::Hashable
      
        # Fully matching images on the page.
        # Can include resized copies of the query image.
        # Corresponds to the JSON property `fullMatchingImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1WebDetectionWebImage>]
        attr_accessor :full_matching_images
      
        # Title for the web page, may contain HTML markups.
        # Corresponds to the JSON property `pageTitle`
        # @return [String]
        attr_accessor :page_title
      
        # Partial matching images on the page.
        # Those images are similar enough to share some key-point features. For
        # example an original image will likely have partial matching for its
        # crops.
        # Corresponds to the JSON property `partialMatchingImages`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1WebDetectionWebImage>]
        attr_accessor :partial_matching_images
      
        # (Deprecated) Overall relevancy score for the web page.
        # Corresponds to the JSON property `score`
        # @return [Float]
        attr_accessor :score
      
        # The result web page URL.
        # Corresponds to the JSON property `url`
        # @return [String]
        attr_accessor :url
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @full_matching_images = args[:full_matching_images] if args.key?(:full_matching_images)
          @page_title = args[:page_title] if args.key?(:page_title)
          @partial_matching_images = args[:partial_matching_images] if args.key?(:partial_matching_images)
          @score = args[:score] if args.key?(:score)
          @url = args[:url] if args.key?(:url)
        end
      end
      
      # A word representation.
      class GoogleCloudVisionV1p2beta1Word
        include Google::Apis::Core::Hashable
      
        # A bounding polygon for the detected image annotation.
        # Corresponds to the JSON property `boundingBox`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1BoundingPoly]
        attr_accessor :bounding_box
      
        # Confidence of the OCR results for the word. Range [0, 1].
        # Corresponds to the JSON property `confidence`
        # @return [Float]
        attr_accessor :confidence
      
        # Additional information detected on the structural component.
        # Corresponds to the JSON property `property`
        # @return [Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1TextAnnotationTextProperty]
        attr_accessor :property
      
        # List of symbols in the word.
        # The order of the symbols follows the natural reading order.
        # Corresponds to the JSON property `symbols`
        # @return [Array<Google::Apis::VisionV1p2beta1::GoogleCloudVisionV1p2beta1Symbol>]
        attr_accessor :symbols
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bounding_box = args[:bounding_box] if args.key?(:bounding_box)
          @confidence = args[:confidence] if args.key?(:confidence)
          @property = args[:property] if args.key?(:property)
          @symbols = args[:symbols] if args.key?(:symbols)
        end
      end
      
      # An object representing a latitude/longitude pair. This is expressed as a pair
      # of doubles representing degrees latitude and degrees longitude. Unless
      # specified otherwise, this must conform to the
      # <a href="http://www.unoosa.org/pdf/icg/2012/template/WGS_84.pdf">WGS84
      # standard</a>. Values must be within normalized ranges.
      class LatLng
        include Google::Apis::Core::Hashable
      
        # The latitude in degrees. It must be in the range [-90.0, +90.0].
        # Corresponds to the JSON property `latitude`
        # @return [Float]
        attr_accessor :latitude
      
        # The longitude in degrees. It must be in the range [-180.0, +180.0].
        # Corresponds to the JSON property `longitude`
        # @return [Float]
        attr_accessor :longitude
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @latitude = args[:latitude] if args.key?(:latitude)
          @longitude = args[:longitude] if args.key?(:longitude)
        end
      end
      
      # This resource represents a long-running operation that is the result of a
      # network API call.
      class Operation
        include Google::Apis::Core::Hashable
      
        # If the value is `false`, it means the operation is still in progress.
        # If `true`, the operation is completed, and either `error` or `response` is
        # available.
        # Corresponds to the JSON property `done`
        # @return [Boolean]
        attr_accessor :done
        alias_method :done?, :done
      
        # The `Status` type defines a logical error model that is suitable for different
        # programming environments, including REST APIs and RPC APIs. It is used by
        # [gRPC](https://github.com/grpc). The error model is designed to be:
        # - Simple to use and understand for most users
        # - Flexible enough to meet unexpected needs
        # # Overview
        # The `Status` message contains three pieces of data: error code, error message,
        # and error details. The error code should be an enum value of
        # google.rpc.Code, but it may accept additional error codes if needed.  The
        # error message should be a developer-facing English message that helps
        # developers *understand* and *resolve* the error. If a localized user-facing
        # error message is needed, put the localized message in the error details or
        # localize it in the client. The optional error details may contain arbitrary
        # information about the error. There is a predefined set of error detail types
        # in the package `google.rpc` that can be used for common error conditions.
        # # Language mapping
        # The `Status` message is the logical representation of the error model, but it
        # is not necessarily the actual wire format. When the `Status` message is
        # exposed in different client libraries and different wire protocols, it can be
        # mapped differently. For example, it will likely be mapped to some exceptions
        # in Java, but more likely mapped to some error codes in C.
        # # Other uses
        # The error model and the `Status` message can be used in a variety of
        # environments, either with or without APIs, to provide a
        # consistent developer experience across different environments.
        # Example uses of this error model include:
        # - Partial errors. If a service needs to return partial errors to the client,
        # it may embed the `Status` in the normal response to indicate the partial
        # errors.
        # - Workflow errors. A typical workflow has multiple steps. Each step may
        # have a `Status` message for error reporting.
        # - Batch operations. If a client uses batch request and batch response, the
        # `Status` message should be used directly inside batch response, one for
        # each error sub-response.
        # - Asynchronous operations. If an API call embeds asynchronous operation
        # results in its response, the status of those operations should be
        # represented directly using the `Status` message.
        # - Logging. If some API errors are stored in logs, the message `Status` could
        # be used directly after any stripping needed for security/privacy reasons.
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::VisionV1p2beta1::Status]
        attr_accessor :error
      
        # Service-specific metadata associated with the operation.  It typically
        # contains progress information and common metadata such as create time.
        # Some services might not provide such metadata.  Any method that returns a
        # long-running operation should document the metadata type, if any.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # The server-assigned name, which is only unique within the same service that
        # originally returns it. If you use the default HTTP mapping, the
        # `name` should have the format of `operations/some/unique/name`.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The normal response of the operation in case of success.  If the original
        # method returns no data on success, such as `Delete`, the response is
        # `google.protobuf.Empty`.  If the original method is standard
        # `Get`/`Create`/`Update`, the response should be the resource.  For other
        # methods, the response should have the type `XxxResponse`, where `Xxx`
        # is the original method name.  For example, if the original method name
        # is `TakeSnapshot()`, the inferred response type is
        # `TakeSnapshotResponse`.
        # Corresponds to the JSON property `response`
        # @return [Hash<String,Object>]
        attr_accessor :response
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @done = args[:done] if args.key?(:done)
          @error = args[:error] if args.key?(:error)
          @metadata = args[:metadata] if args.key?(:metadata)
          @name = args[:name] if args.key?(:name)
          @response = args[:response] if args.key?(:response)
        end
      end
      
      # The `Status` type defines a logical error model that is suitable for different
      # programming environments, including REST APIs and RPC APIs. It is used by
      # [gRPC](https://github.com/grpc). The error model is designed to be:
      # - Simple to use and understand for most users
      # - Flexible enough to meet unexpected needs
      # # Overview
      # The `Status` message contains three pieces of data: error code, error message,
      # and error details. The error code should be an enum value of
      # google.rpc.Code, but it may accept additional error codes if needed.  The
      # error message should be a developer-facing English message that helps
      # developers *understand* and *resolve* the error. If a localized user-facing
      # error message is needed, put the localized message in the error details or
      # localize it in the client. The optional error details may contain arbitrary
      # information about the error. There is a predefined set of error detail types
      # in the package `google.rpc` that can be used for common error conditions.
      # # Language mapping
      # The `Status` message is the logical representation of the error model, but it
      # is not necessarily the actual wire format. When the `Status` message is
      # exposed in different client libraries and different wire protocols, it can be
      # mapped differently. For example, it will likely be mapped to some exceptions
      # in Java, but more likely mapped to some error codes in C.
      # # Other uses
      # The error model and the `Status` message can be used in a variety of
      # environments, either with or without APIs, to provide a
      # consistent developer experience across different environments.
      # Example uses of this error model include:
      # - Partial errors. If a service needs to return partial errors to the client,
      # it may embed the `Status` in the normal response to indicate the partial
      # errors.
      # - Workflow errors. A typical workflow has multiple steps. Each step may
      # have a `Status` message for error reporting.
      # - Batch operations. If a client uses batch request and batch response, the
      # `Status` message should be used directly inside batch response, one for
      # each error sub-response.
      # - Asynchronous operations. If an API call embeds asynchronous operation
      # results in its response, the status of those operations should be
      # represented directly using the `Status` message.
      # - Logging. If some API errors are stored in logs, the message `Status` could
      # be used directly after any stripping needed for security/privacy reasons.
      class Status
        include Google::Apis::Core::Hashable
      
        # The status code, which should be an enum value of google.rpc.Code.
        # Corresponds to the JSON property `code`
        # @return [Fixnum]
        attr_accessor :code
      
        # A list of messages that carry the error details.  There is a common set of
        # message types for APIs to use.
        # Corresponds to the JSON property `details`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :details
      
        # A developer-facing error message, which should be in English. Any
        # user-facing error message should be localized and sent in the
        # google.rpc.Status.details field, or localized by the client.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @details = args[:details] if args.key?(:details)
          @message = args[:message] if args.key?(:message)
        end
      end
    end
  end
end
