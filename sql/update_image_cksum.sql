UPDATE images
    SET image_md5 = :checksum
    WHERE images.path = :path;