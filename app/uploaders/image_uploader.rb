class ImageUploader < CarrierWave::Uploader::Base
    # Include RMagick or MiniMagick support:
    # include CarrierWave::RMagick
    include CarrierWave::MiniMagick

    # Choose what kind of storage to use for this uploader:
    # storage :file
    # storage :fog

    def store_dir
        "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end

    process resize_to_fit: [800, 800]

    version :thumb do
        process resize_to_fill: [200, 200]
    end

    version :medium do
        process resize_to_fill: [400, 400]
    end
end
