require 'html-proofer'

task :test do
    sh "bundle exec jekyll build --destination='_site'"
    options = {
        :checks_to_ignore => 'ImageCheck',
        :url_ignore => '/^((?!github\.com\/.*\/wiki\/).)*$/'
    } # test only links to Github wiki
    HTMLProofer.check_directory("./_site", options).run
end
