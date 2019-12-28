{ pkgs, ... }:

{
    config = {
        home.file.".config/openbox/menu.xml".source = builtins.toFile "menu.xml" ''
            <?xml version="1.0" encoding="utf-8"?>
            <openbox_menu xmlns="http://openbox.org/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://openbox.org/ file:///usr/share/openbox/menu.xsd">
            <menu id="root-menu" label="Openbox 3">
                <separator label="Applications" />
                <item label="MultiMC">
                    <action name="Execute">
                        <command>
                            multimc
                        </command>
                    </action>
                </item>
                <item label="Browser">
                    <action name="Execute">
                        <command>
                            firefox
                        </command>
                    </action>
                </item>
                <item label="Files">
                    <action name="Execute">
                        <command>
                            thunar
                        </command>
                    </action>
                </item>
                <item label="Office">
                    <action name="Execute">
                        <command>
                            libreoffice
                        </command>
                    </action>
                </item>
                <item label="Terminal">
                    <action name="Execute">
                        <command>
                            urxvt
                        </command>
                    </action>
                </item>
                <separator label="System" />
                <menu id="system" label="System">
                    <item label="Log out">
                        <action name="Execute">
                            <command>
                                openbox --exit
                            </command>
                        </action>
                    </item>
                    <item label="Reboot">
                        <action name="Execute">
                            <command>
                                shutdown -r now
                            </command>
                        </action>
                    </item>
                    <item label="Shut down">
                        <action name="Execute">
                            <command>
                                shutdown -P now
                            </command>
                        </action>
                    </item>
                </menu>
            </menu>
            </openbox_menu>
        '';
    };
}