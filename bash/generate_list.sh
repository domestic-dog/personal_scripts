for i in $(ls ./rel_configs);
    do
      echo $i:;
      cat ./rel_configs/$i/.inventory
      echo ""
      for x in $(ls ./rel_configs/$i/opt/wildfly/standalone/configuration/iflex/)
          do
              echo "$x: $x";
          done

    done