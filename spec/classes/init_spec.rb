require 'spec_helper'
describe 'hddtemp' do

  describe 'config files' do
    context 'with default params on osfamily RedHat' do
      let :facts do
        {
          :osfamily          => 'RedHat',
          :lsbmajdistrelease => '5',
        }
      end

      it { should contain_class('hddtemp') }
      it { should contain_service('hddtemp') }
        
      it {
        should contain_file('hddtemp_config_file').with({
          'ensure'  => 'file',
          'path'    => '/etc/sysconfig/hddtemp',
          'owner'   => 'root',
          'group'   => 'root',
          'mode'    => '0644',
        })
      }
    end
    
      context 'with default params on osfamily SuSE' do
        let :facts do
          {
            :osfamily          => 'SuSE',
            :lsbmajdistrelease => '11',
          }
        end

        it { should contain_class('hddtemp') }
        it { should contain_service('hddtemp') }
          
        it {
          should contain_file('hddtemp_config_file').with({
            'ensure'  => 'file',
            'path'    => '/etc/sysconfig/hddtemp',
            'owner'   => 'root',
            'group'   => 'root',
            'mode'    => '0644',
          })
        }     
    end
  end 
end  