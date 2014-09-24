# -*- mode: ruby -*-
# vi: set ft=ruby :

class ruby::install {

    $RUBY_VERSION  = "ruby-2.0.0-p247"

    exec { "rvm-install":
        command  => "curl -sSL https://get.rvm.io | sudo bash -s stable",
        path     => ["/usr/bin", "/bin"],
        creates  => "/usr/local/rvm",
    }

    exec { "ruby-install":
        command  => "rvm install ${RUBY_VERSION}",
        path     => ["/usr/bin", "/usr/local/rvm/bin", "/bin", "/usr/local/sbin", "/usr/sbin", "/sbin"],
        timeout  => 600,
        creates  => "/usr/local/rvm/rubies/${RUBY_VERSION}",
        require  =>  Exec["rvm-install"]
    }

}
