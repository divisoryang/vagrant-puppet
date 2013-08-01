require 'spec_helper'

describe 'golang', :type => :class do
  let(:facts) { {:osfamily => 'Debian', :lsbdistcodename => 'precise'} }

  context 'with no parameters' do
    it { should include_class('apt') }
    it { should contain_package('new-golang').with_name('golang').with_ensure('present') }
    it { should contain_apt__ppa('ppa:james-page/golang-backports') }
  end

  context 'with a custom version' do
    let(:params) { {'version' => 'absent' } }
    it { should contain_package('new-golang').with_ensure('absent') }
  end

  context 'with an invalid package name' do
    let(:params) { {'package_name' => 'invalid' } }
    it do
      expect {
        should contain_package('golang')
      }.to raise_error(Puppet::Error, /"invalid" does not match/)
    end
  end

  context 'with an invalid distro name' do
    let(:facts) { {:osfamily => 'RedHat'} }
    it do
      expect {
        should contain_package('new-golang')
      }.to raise_error(Puppet::Error, /This module uses PPA repos/)
    end
  end

end
