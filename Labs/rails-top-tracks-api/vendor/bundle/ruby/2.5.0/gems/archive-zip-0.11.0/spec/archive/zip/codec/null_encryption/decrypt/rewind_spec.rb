# encoding: UTF-8

require 'minitest/autorun'

require File.expand_path('../../fixtures/classes', __FILE__)

require 'archive/zip/codec/null_encryption'

describe "Archive::Zip::Codec::NullEncryption::Decrypt#rewind" do
  it "can rewind the stream when the delegate responds to rewind" do
    NullEncryptionSpecs.encrypted_data do |ed|
      Archive::Zip::Codec::NullEncryption::Decrypt.open(ed) do |d|
        d.read(4)
        d.rewind
        d.read.must_equal(NullEncryptionSpecs.test_data)
      end
    end
  end

  it "raises Errno::EINVAL when attempting to rewind the stream when the delegate does not respond to rewind" do
    delegate = MiniTest::Mock.new
    delegate.expect(:close, nil)
    Archive::Zip::Codec::NullEncryption::Decrypt.open(delegate) do |d|
      lambda { d.rewind }.must_raise(Errno::EINVAL)
    end
  end
end
