
Pod::Spec.new do |s|
          #1.
          s.name               = "PKCircularProgress"
          #2.
          s.version            = "1.0.0"
          #3.  
          s.summary            = "This will create circular progress to show scores, percentage and many more.."
          #4.
          s.homepage           = "http://www.pravincoolswift.com"
          #5.
          s.license            = "MIT"
          #6.
          s.author             = "Pravin Kulkarni"
          #7.
          s.platform           = :ios, "10.0"
          #8.
          s.source             = { :git => "https://github.com/pravinsonicjobs/PKCircularProgress.git", :tag => "1.0.0" }
          #9.
          s.source_files       = "PKCircularProgress", "PKCircularProgress/**/*.{h,m,swift}"
    end