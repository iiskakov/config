# Sample Maid rules file -- some ideas to get you started.
#
# To use, remove ".sample" from the filename, and modify as desired.  Test using:
#
#     maid clean -n
#
# **NOTE:** It's recommended you just use this as a template; if you run these rules on your machine without knowing
# what they do, you might run into unwanted results!
#
# Don't forget, it's just Ruby!  You can define custom methods and use them below:
# 
#     def magic(*)
#       # ...
#     end
# 
# If you come up with some cool tools of your own, please send me a pull request on GitHub!  Also, please consider sharing your rules with others via [the wiki](https://github.com/benjaminoakes/maid/wiki).
#
# For more help on Maid:
#
# * Run `maid help`
# * Read the README, tutorial, and documentation at https://github.com/benjaminoakes/maid#maid
# * Ask me a question over email (hello@benjaminoakes.com) or Twitter (@benjaminoakes)
# * Check out how others are using Maid in [the Maid wiki](https://github.com/benjaminoakes/maid/wiki)


DOWNLOADS = File.expand_path '~/Downloads'

DOWNLOADED_PICTURES   = "#{DOWNLOADS}/pictures"
DOWNLOADED_BOOKS   = "#{DOWNLOADS}/books"
DOWNLOADED_MUSIC      = "#{DOWNLOADS}/music"
DOWNLOADED_ARCHIVES   = "#{DOWNLOADS}/archives"
DOWNLOADED_TARBALLS   = "#{DOWNLOADS}/archives/tarballs"
DOWNLOADED_PDFS  = "#{DOWNLOADS}/pdfs"
DOWNLOADED_DOCUMENTS  = "#{DOWNLOADS}/documents"


DOWNLOADED_SOFTWARE   = "#{DOWNLOADS}/software"


def dir_safe(expression)

  dir(expression).select do |file|
    not downloading?(file)
  end
end

Maid.rules do
  # **NOTE:** It's recommended you just use this as a template; if you run these rules on your machine without knowing
  # what they do, you might run into unwanted results!


      rule 'Move: Screenshots based on atime' do
          dir('~/Desktop/Telegram\ Desktop/*').each do |path|
            if 1.week.since?(accessed_at(path))
              move(path, '~/Documents/telegram/')
            end
          end
      end

      rule 'Trash downloads that have a limited lifetime' do
        # Often shared from Skype, etc
        dir('~/Downloads/Telegram\ Desktop/*').each do |p|
          trash(p) if 7.days.since?(accessed_at(p))
        end
      end

      rule 'Trash duplicate downloads' do
          # Keep the dupe with the shortest filename
          trash verbose_dupes_in('~/Downloads/*')
        end

      rule 'Mac OS X torrents in disk images' do
          trash(dir('~/Downloads/*.torrent'))
        end

        rule 'Mac OS X applications in disk images' do
          trash(dir('~/Downloads/*.dmg'))
        end

        rule 'Mac OS X applications in zip files' do
          found = dir('~/Downloads/*.zip').select { |path|
            zipfile_contents(path).any? { |c| c.match(/\.app$/) }
          }

          trash(found)
        end

      rule 'Remove empty directories' do
          dir(['~/Downloads/*']).each do |path|
              if File.directory?(path) && dir("#{ path }/*").empty?
                  trash(path)
              end
          end
      end

    Maid.rules do

      rule 'Downloaded docs' do
      
      [
        'xlsx',
        'xls',
        'odt',
        'doc',
        'docx',
      ].each do |ext|
      
        dir_safe( "~/Downloads/*.#{ext}" ).each do |file|
          move file, DOWNLOADED_DOCUMENTS
        end
      end
    end

      rule 'Downloaded archives' do
    
      [
        'zip',
        'rar',
        '7z',
      ].each do |ext|
      
        dir_safe( "~/Downloads/*.#{ext}" ).each do |file|
          move file, DOWNLOADED_ARCHIVES
        end
      end
      
      [
        'tar',
        'tar.gz',
        'tar.bz2',
        'tar.xz',
        'tgz',
      ].each do |ext|
      
        dir_safe( "~/Downloads/*.#{ext}" ).each do |file|
          move file, DOWNLOADED_TARBALLS
        end
      end
    end
      
    rule 'Downloaded books' do
        
        [
          'mobi',
          'epub',
          'fb2',
          'djvu',
        ].each do |ext|
        
          dir_safe( "~/Downloads/*.#{ext}" ).each do |file|
            move file, DOWNLOADED_BOOKS
          end
        end
      end

    rule 'Downloaded pics' do
        
        [
          'png',
          'jpg',
          'JPG',
          'CR2',
          'PNG',
          'jpeg',
          'gif',
        ].each do |ext|
        
          dir_safe( "~/Downloads/*.#{ext}" ).each do |file|
            move file, DOWNLOADED_PICTURES
          end
        end
      end

    rule 'Downloaded PDF books' do
      dir_safe( "~/Downloads/*.pdf" ).each do |file|
        move file, DOWNLOADED_PDFS
      end
    end
  end

end
